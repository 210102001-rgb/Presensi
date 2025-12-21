<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function index()
    {
        $locations = Location::orderBy('name')->paginate(10);
        
        return inertia('Admin/Locations/Index', [
            'locations' => $locations
        ]);
    }

    public function create()
    {
        return inertia('Admin/Locations/Create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string|max:500',
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
            'radius' => 'required|numeric|min:1|max:1000',
            'description' => 'nullable|string|max:1000',
        ]);

        Location::create([
            'name' => $request->name,
            'address' => $request->address,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'radius' => $request->radius,
            'description' => $request->description,
            'created_by' => auth()->id(),
        ]);

        return redirect()->route('admin.locations.index')
            ->with('success', 'Lokasi berhasil ditambahkan.');
    }

    public function show(Location $location)
    {
        $location->load(['schedules', 'creator']);
        
        return inertia('Admin/Locations/Show', [
            'location' => $location
        ]);
    }

    public function edit(Location $location)
    {
        return inertia('Admin/Locations/Edit', [
            'location' => $location
        ]);
    }

    public function update(Request $request, Location $location)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string|max:500',
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
            'radius' => 'required|numeric|min:1|max:1000',
            'description' => 'nullable|string|max:1000',
        ]);

        $location->update($request->all());

        return redirect()->route('admin.locations.index')
            ->with('success', 'Lokasi berhasil diperbarui.');
    }

    public function destroy(Location $location)
    {
        // Check if location is being used by any schedules
        if ($location->schedules()->count() > 0) {
            return back()->with('error', 'Lokasi tidak dapat dihapus karena masih digunakan dalam jadwal.');
        }

        $location->delete();

        return redirect()->route('admin.locations.index')
            ->with('success', 'Lokasi berhasil dihapus.');
    }
}
