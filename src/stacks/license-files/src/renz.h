// -*-mode:c++; c-style:k&r; c-basic-offset:4;-*-
//
// Copyright 2011-2015, Julian Catchen <jcatchen@uoregon.edu>
//
// This file is part of Stacks.
//
// Stacks is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Stacks is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Stacks.  If not, see <http://www.gnu.org/licenses/>.
//

#ifndef __RENZ_H__
#define __RENZ_H__

#include <map>
using std::map;
#include <string>
using std::string;

const char *apeKI[]   = {"CAGC", "CTGC",      // G/CWGC, ApeKI; W=A or T
 			 "GTCG", "GACG"};
const char *apoI[]    = {"AATTC", "AATTT",    // R/AATTY, ApoI  (also known as XapI)
                         "GAATT", "AAATT"};
const char *bamHI[]   = {"GATCC",             // G/GATCC, BamHI
			 "GGATC"};
const char *bgIII[]   = {"GATCT",             // A/GATCT, BgIII
			 "AGATC"};
const char *bstYI[]   = {"GATCC", "GATCT",    // R/GATCY, BstYI (also known as PsuI)
                         "GGATC", "AGATC"};
const char *claI[]    = {"CGAT",              // AT/CGAT, ClaI
                         "ATCG"};
const char *dpnII[]   = {"GATC",              // GATC, DpnII
			 "GATC"};
const char *eaeI[]    = {"GGCCA", "GGCCG",    // Y/GGCCR, EaeI
			 "TGGCC", "CGGCC"};
const char *ecoRI[]   = {"AATTC",             // G/AATTC, EcoRI
			 "GAATT"};
const char *ecoRV[]   = {"ATC",               // GAT/ATC, EcoRV
			 "GAT"};
const char *ecoT22I[] = {"TGCAT",             // A/TGCAT, EcoT22I
			 "ATGCA"};
const char *hindIII[] = {"AGCTT",             // A/AGCTT, HindIII
			 "TCGAA"};
const char *mluCI[]   = {"AATT",              // AATT, MluCI
			 "AATT"};
const char *mseI[]    = {"TAA",               // T/TAA, MseI
 			 "TTA"};
const char *mspI[]    = {"CGG",               // C/CGG, MspI
			 "CCG"};
const char *ndeI[]    = {"TA",                // CA/TATG, NdeI
			 "TA"};
const char *nheI[]    = {"CTAGC",             // G/CTAGC, NheI
                         "GCTAG"};
const char *nlaIII[]  = {"CATG",              // CATG, NlaIII
			 "CATG"};
const char *notI[]    = {"GGCCGC",            // GC/GGCCGC, NotI
			 "GCGGCC"};
const char *nsiI[]    = {"TGCAT",             // ATGCA/T, NsiI
			 "ATGCA"};
const char *pstI[]    = {"TGCAG",             // CTGCA/G, PstI
			 "CTGCA"};
const char *sacI[]    = {"AGCTC",             // GAGCT/C, SacI
			 "GAGCT"};
const char *sau3AI[]  = {"GATC",              // GATC, Sau3AI
			 "GATC"};
const char *sbfI[]    = {"TGCAGG",            // CCTGCA/GG, SbfI
			 "CCTGCA"};
const char *sexAI[]   = {"CCAGGT", "CCTGGT",  // A/CCWGGT, SexAI; W=A or T
			 "ACCTGG", "ACCAGG"};
const char *sgrAI[]   = {"CCGGCG", "CCGGTG",  // CR/CCGGYG, SgrAI; R=A or G; Y=C or T
			 "CGCCGG", "CACCGG"};
const char *speI[]    = {"CTAGT",             // A/CTAGT, SpeI
                         "ACTAG"};
const char *sphI[]    = {"CATGC",             // GCATG/C, SphI
			 "GCATG"};
const char *taqI[]    = {"CGA",               // T/CGA, TaqI
			 "TCG"};
const char *xbaI[]    = {"CTAGA",             // T/CTAGA, XbaI
			 "TCTAG"};
const char *xhoI[]    = {"TCGAG",             // C/TCGAG, XhoI
                         "CTCGA"};

void 
initialize_renz(map<string, const char **> &renz, map<string, int> &renz_cnt, map<string, int> &renz_len) {

    renz["sbfI"]    = sbfI;    // CCTGCA/GG, SbfI
    renz["pstI"]    = pstI;    // CTGCA/G, PstI
    renz["notI"]    = notI;    // GC/GGCCGC, NotI
    renz["ecoRI"]   = ecoRI;   // G/AATTC, EcoRI
    renz["sgrAI"]   = sgrAI;   // CR/CCGGYG, SgrAI; R=A or G; Y=C or T
    renz["apeKI"]   = apeKI;   // G/CWGC, ApeKI; W=A or T
    renz["hindIII"] = hindIII; // A/AGCTT, HindIII
    renz["dpnII"]   = dpnII;   // GATC, DpnII
    renz["sphI"]    = sphI;    // GCATG/C, SphI
    renz["nlaIII"]  = nlaIII;  // CATG, NlaIII
    renz["mluCI"]   = mluCI;   // AATT, MluCI
    renz["ecoT22I"] = ecoT22I; // A/TGCAT, EcoT22I
    renz["ndeI"]    = ndeI;    // CA/TATG, NdeI
    renz["nsiI"]    = nsiI;    // ATGCA/T, NsiI
    renz["mseI"]    = mseI;    // T/TAA, MseI
    renz["mspI"]    = mspI;    // C/CGG, MspI
    renz["sexAI"]   = sexAI;   // A/CCWGGT, SexAI; W=A or T
    renz["sau3AI"]  = sau3AI;  // GATC, Sau3AI
    renz["bamHI"]   = bamHI;   // G/GATCC, BamHI
    renz["xbaI"]    = xbaI;    // T/CTAGA, XbaI
    renz["eaeI"]    = eaeI;    // Y/GGCCR, EaeI
    renz["taqI"]    = taqI;    // T/CGA, TaqI
    renz["claI"]    = claI;    // AT/CGAT, ClaI
    renz["nheI"]    = nheI;    // G/CTAGC, NheI
    renz["speI"]    = speI;    // A/CTAGT, SpeI
    renz["apoI"]    = apoI;    // R/AATTY, ApoI, XapI
    renz["bstYI"]   = bstYI;   // R/GATCY, BstYI, PsuI
    renz["xhoI"]    = xhoI;    // C/TCGAG, XhoI
    renz["sacI"]    = sacI;    // GAGCT/C, SacI
    renz["bgIII"]   = bgIII;   // A/GATCT, BgIII
    renz["ecoRV"]   = ecoRV;   // GAT/ATC, EcoRV

    renz_cnt["sbfI"]    = 1;
    renz_cnt["pstI"]    = 1;
    renz_cnt["notI"]    = 1;
    renz_cnt["ecoRI"]   = 1;
    renz_cnt["sgrAI"]   = 2;
    renz_cnt["apeKI"]   = 2;
    renz_cnt["hindIII"] = 1;
    renz_cnt["dpnII"]   = 1;
    renz_cnt["sphI"]    = 1;
    renz_cnt["nlaIII"]  = 1;
    renz_cnt["mluCI"]   = 1;
    renz_cnt["ecoT22I"] = 1;
    renz_cnt["ndeI"]    = 1;
    renz_cnt["nsiI"]    = 1;
    renz_cnt["mseI"]    = 1;
    renz_cnt["mspI"]    = 1;
    renz_cnt["sexAI"]   = 2;
    renz_cnt["sau3AI"]  = 1;
    renz_cnt["bamHI"]   = 1;
    renz_cnt["xbaI"]    = 1;
    renz_cnt["eaeI"]    = 2;
    renz_cnt["taqI"]    = 1;
    renz_cnt["claI"]    = 1;
    renz_cnt["nheI"]    = 1;
    renz_cnt["speI"]    = 1;
    renz_cnt["apoI"]    = 2;
    renz_cnt["bstYI"]   = 2;
    renz_cnt["xhoI"]    = 1;
    renz_cnt["sacI"]    = 1;
    renz_cnt["bgIII"]   = 1;
    renz_cnt["ecoRV"]   = 1;

    renz_len["sbfI"]    = 6;
    renz_len["pstI"]    = 5;
    renz_len["notI"]    = 6;
    renz_len["ecoRI"]   = 5;
    renz_len["sgrAI"]   = 6;
    renz_len["apeKI"]   = 4;
    renz_len["hindIII"] = 5;
    renz_len["dpnII"]   = 4;
    renz_len["sphI"]    = 5;
    renz_len["nlaIII"]  = 4;
    renz_len["mluCI"]   = 4;
    renz_len["ecoT22I"] = 5;
    renz_len["ndeI"]    = 2;
    renz_len["nsiI"]    = 5;
    renz_len["mseI"]    = 3;
    renz_len["mspI"]    = 3;
    renz_len["sexAI"]   = 6;
    renz_len["sau3AI"]  = 4;
    renz_len["bamHI"]   = 5;
    renz_len["xbaI"]    = 5;
    renz_len["eaeI"]    = 5;
    renz_len["taqI"]    = 3;
    renz_len["claI"]    = 4;
    renz_len["nheI"]    = 5;
    renz_len["speI"]    = 5;
    renz_len["apoI"]    = 5;
    renz_len["bstYI"]   = 5;
    renz_len["xhoI"]    = 5;
    renz_len["sacI"]    = 5;
    renz_len["bgIII"]   = 5;
    renz_len["ecoRV"]   = 3;
}

#endif // __RENZ_H__
