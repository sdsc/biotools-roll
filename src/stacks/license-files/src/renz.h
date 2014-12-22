// -*-mode:c++; c-style:k&r; c-basic-offset:4;-*-
//
// Copyright 2011-2012, Julian Catchen <jcatchen@uoregon.edu>
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

const char *sbfI[]    = {"TGCAGG",            // CCTGCA/GG, SbfI
			 "CCTGCA"};
const char *pstI[]    = {"TGCAG",             // CTGCA/G, PstI
			 "CTGCA"};
const char *ecoRI[]   = {"AATTC",             // G/AATTC, EcoRI
			 "GAATT"};
const char *sgrAI[]   = {"CCGGCG", "CCGGTG",  // CR/CCGGYG, SgrAI; R=A or G; Y=C or T
			 "CGCCGG", "CACCGG"};
const char *notI[]    = {"GGCCGC",            // GC/GGCCGC, NotI
			 "GCGGCC"};
// const char *haeIII[]  = {"GGCC",
// 			 "GGCC"};
// const char *aluI[]    = {"AGCT",
// 			 "AGCT"};
const char *mseI[]    = {"TAA",               // T/TAA, MseI
 			 "TTA"};
const char *apeKI[]   = {"CAGC", "CTGC",      // G/CWGC, ApeKI; W=A or T
 			 "GTCG", "GACG"};
const char *hindIII[] = {"AGCTT",             // A/AGCTT, HindIII
			 "TCGAA"};
const char *dpnII[]   = {"GATC",              // GATC, DpnII
			 "GATC"};
const char *sphI[]    = {"CATGC",             // GCATG/C, SphI
			 "GCATG"};
const char *nlaIII[]  = {"CATG",              // CATG, NlaIII
			 "CATG"};
const char *mluCI[]   = {"AATT",              // AATT, MluCI
			 "AATT"};
const char *ecoT22I[] = {"TGCAT",             // A/TGCAT, EcoT22I
			 "ATGCA"};
const char *ndeI[]    = {"TA",                // CA/TATG, NdeI
			 "TA"};
const char *nsiI[]    = {"TGCAT",             // ATGCA/T, NsiI
			 "ATGCA"};
const char *mspI[]    = {"CGG",               // C/CGG, MspI
			 "CCG"};
const char *sexAI[]   = {"CCAGGT", "CCTGGT",  // A/CCWGGT, SexAI; W=A or T
			 "ACCTGG", "ACCAGG"};
const char *sau3AI[]  = {"GATC",              // GATC, Sau3AI
			 "GATC"};
const char *bamHI[]   = {"GATCC",             // G/GATCC, BamHI
			 "GGATC"};
const char *xbaI[]    = {"CTAGA",             // T/CTAGA, XbaI
			 "TCTAG"};
const char *eaeI[]    = {"GGCCA", "GGCCG",    // Y/GGCCR, EaeI
			 "TGGCC", "CGGCC"};
const char *taqI[]    = {"CGA",               // T/CGA, TaqI
			 "TCG"};
const char *claI[]    = {"CGAT",              // AT/CGAT, ClaI
                         "ATCG"};
const char *nheI[]    = {"CTAGC",              // G/CTAGC, NheI
                         "GCTAG"};
const char *speI[]    = {"CTAGT",              // A/CTAGT, SpeI
                         "ACTAG"};

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
}

#endif // __RENZ_H__
