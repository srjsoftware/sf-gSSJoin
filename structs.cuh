/*********************************************************************
11	
12	 Copyright (C) 2015 by Wisllay Vitrio
13	
14	 This program is free software; you can redistribute it and/or modify
15	 it under the terms of the GNU General Public License as published by
16	 the Free Software Foundation; either version 2 of the License, or
17	 (at your option) any later version.
18	
19	 This program is distributed in the hope that it will be useful,
20	 but WITHOUT ANY WARRANTY; without even the implied warranty of
21	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
22	 GNU General Public License for more details.
23	
24	 You should have received a copy of the GNU General Public License
25	 along with this program; if not, write to the Free Software
26	 Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
27	
28	 ********************************************************************/

/*
 * structs.cuh
 *
 *  Created on: Dec 4, 2013
 *      Author: silvereagle
 */

#ifndef STRUCTS_CUH_
#define STRUCTS_CUH_

using namespace std;

struct Entry {
    int set_id;
    int term_id;

    __host__ __device__ Entry(int doc_id, int term_id) : set_id(doc_id), term_id(term_id) {}

    bool operator < (const Entry& e) const {
        if(set_id != e.set_id) return set_id < e.set_id;
        return term_id < e.term_id;
    }
};

struct Pair {
	int set_x;
	int set_y;
	float similarity;
};

struct DeviceVariables{
	int *d_sizes, *d_starts, *d_intersection, *d_index, *d_count;
    Entry *d_inverted_index, *d_entries, *d_probes;
    Pair *h_pairs, *d_pairs;
};

struct FileStats {
	int num_sets;
	int num_terms;

	vector<int> sizes; // set sizes
	vector<int> start; // beginning of each sets

	FileStats() : num_sets(0), num_terms(0) {}
};

#endif /* STRUCTS_CUH_ */
