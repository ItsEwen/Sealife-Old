local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg, hasPaid
local clothes = {}

ClotheShop = {	
	Sac = {
		{Label = 'Sac N°',    Value = 0},
		{Label = 'Sac N°',    Value = 1},
		{Label = 'Sac N°',    Value = 2},
		{Label = 'Sac N°',    Value = 3},
		{Label = 'Sac N°',    Value = 4},
		{Label = 'Sac N°',    Value = 5},
		{Label = 'Sac N°',    Value = 6},
		{Label = 'Sac N°',    Value = 7},
		{Label = 'Sac N°',    Value = 8},
		{Label = 'Sac N°',    Value = 9},
		{Label = 'Sac N°',    Value = 10},
		{Label = 'Sac N°',    Value = 11},
		{Label = 'Sac N°',    Value = 12},
		{Label = 'Sac N°',    Value = 13},
		{Label = 'Sac N°',    Value = 14},
		{Label = 'Sac N°',    Value = 15},
		{Label = 'Sac N°',    Value = 16},
		{Label = 'Sac N°',    Value = 17},
		{Label = 'Sac N°',    Value = 18},
		{Label = 'Sac N°',    Value = 19},
		{Label = 'Sac N°',    Value = 20},
		{Label = 'Sac N°',    Value = 21},
		{Label = 'Sac N°',    Value = 22},
		{Label = 'Sac N°',    Value = 23},
		{Label = 'Sac N°',    Value = 24},
		{Label = 'Sac N°',    Value = 25},
		{Label = 'Sac N°',    Value = 26},
		{Label = 'Sac N°',    Value = 27},
		{Label = 'Sac N°',    Value = 28},
		{Label = 'Sac N°',    Value = 29},
		{Label = 'Sac N°',    Value = 30},
		{Label = 'Sac N°',    Value = 31},
		{Label = 'Sac N°',    Value = 32},
		{Label = 'Sac N°',    Value = 33},
		{Label = 'Sac N°',    Value = 34},
		{Label = 'Sac N°',    Value = 35},
		{Label = 'Sac N°',    Value = 36},
		{Label = 'Sac N°',    Value = 37},
		{Label = 'Sac N°',    Value = 38},
		{Label = 'Sac N°',    Value = 39},
		{Label = 'Sac N°',    Value = 40},
		{Label = 'Sac N°',    Value = 41},
		{Label = 'Sac N°',    Value = 42},
		{Label = 'Sac N°',    Value = 43},
		{Label = 'Sac N°',    Value = 44},
		{Label = 'Sac N°',    Value = 45},
		{Label = 'Sac N°',    Value = 46},
		{Label = 'Sac N°',    Value = 47},
		{Label = 'Sac N°',    Value = 48},
		{Label = 'Sac N°',    Value = 49},
		{Label = 'Sac N°',    Value = 50},
		{Label = 'Sac N°',    Value = 51},
		{Label = 'Sac N°',    Value = 52},
		{Label = 'Sac N°',    Value = 53},
		{Label = 'Sac N°',    Value = 54},
		{Label = 'Sac N°',    Value = 55},
		{Label = 'Sac N°',    Value = 56},
		{Label = 'Sac N°',    Value = 57},
		{Label = 'Sac N°',    Value = 58},
		{Label = 'Sac N°',    Value = 59},
		{Label = 'Sac N°',    Value = 60},
		{Label = 'Sac N°',    Value = 61},
		{Label = 'Sac N°',    Value = 62},
		{Label = 'Sac N°',    Value = 63},
		{Label = 'Sac N°',    Value = 64},
		{Label = 'Sac N°',    Value = 65},
		{Label = 'Sac N°',    Value = 66},
		{Label = 'Sac N°',    Value = 67},
		{Label = 'Sac N°',    Value = 68},
		{Label = 'Sac N°',    Value = 69},
		{Label = 'Sac N°',    Value = 70},
		{Label = 'Sac N°',    Value = 71},
		{Label = 'Sac N°',    Value = 72},
		{Label = 'Sac N°',    Value = 73},
		{Label = 'Sac N°',    Value = 74},
		{Label = 'Sac N°',    Value = 75},
		{Label = 'Sac N°',    Value = 76},
		{Label = 'Sac N°',    Value = 77},
		{Label = 'Sac N°',    Value = 78},
		{Label = 'Sac N°',    Value = 79},
		{Label = 'Sac N°',    Value = 80},
		{Label = 'Sac N°',    Value = 81},
		{Label = 'Sac N°',    Value = 82},
		{Label = 'Sac N°',    Value = 83},
		{Label = 'Sac N°',    Value = 84},
		{Label = 'Sac N°',    Value = 85},
		{Label = 'Sac N°',    Value = 86},
		{Label = 'Sac N°',    Value = 87},
		{Label = 'Sac N°',    Value = 88},
		{Label = 'Sac N°',    Value = 89},
		{Label = 'Sac N°',    Value = 90},
		{Label = 'Sac N°',    Value = 91},
		{Label = 'Sac N°',    Value = 92},
		{Label = 'Sac N°',    Value = 93}
	},
	
	Lunette = {
		{Label = 'Lunette N°',    Value = 0},
		{Label = 'Lunette N°',    Value = 1},
		{Label = 'Lunette N°',    Value = 2},
		{Label = 'Lunette N°',    Value = 3},
		{Label = 'Lunette N°',    Value = 4},
		{Label = 'Lunette N°',    Value = 5},
		{Label = 'Lunette N°',    Value = 6},
		{Label = 'Lunette N°',    Value = 7},
		{Label = 'Lunette N°',    Value = 8},
		{Label = 'Lunette N°',    Value = 9},
		{Label = 'Lunette N°',    Value = 10},
		{Label = 'Lunette N°',    Value = 11},
		{Label = 'Lunette N°',    Value = 12},
		{Label = 'Lunette N°',    Value = 13},
		{Label = 'Lunette N°',    Value = 14},
		{Label = 'Lunette N°',    Value = 15},
		{Label = 'Lunette N°',    Value = 16},
		{Label = 'Lunette N°',    Value = 17},
		{Label = 'Lunette N°',    Value = 18},
		{Label = 'Lunette N°',    Value = 19},
		{Label = 'Lunette N°',    Value = 20},
		{Label = 'Lunette N°',    Value = 21},
		{Label = 'Lunette N°',    Value = 22},
		{Label = 'Lunette N°',    Value = 23},
		{Label = 'Lunette N°',    Value = 24},
		{Label = 'Lunette N°',    Value = 25},
		{Label = 'Lunette N°',    Value = 26},
		{Label = 'Lunette N°',    Value = 27},
		{Label = 'Lunette N°',    Value = 28},
		{Label = 'Lunette N°',    Value = 29},
		{Label = 'Lunette N°',    Value = 30},
		{Label = 'Lunette N°',    Value = 31},
		{Label = 'Lunette N°',    Value = 32},
		{Label = 'Lunette N°',    Value = 33}
	},
	
	Chapeau = {
		{Label = 'Chapeau N°',    Value = 0},
		{Label = 'Chapeau N°',    Value = 1},
		{Label = 'Chapeau N°',    Value = 2},
		{Label = 'Chapeau N°',    Value = 3},
		{Label = 'Chapeau N°',    Value = 4},
		{Label = 'Chapeau N°',    Value = 5},
		{Label = 'Chapeau N°',    Value = 6},
		{Label = 'Chapeau N°',    Value = 7},
		{Label = 'Chapeau N°',    Value = 8},
		{Label = 'Chapeau N°',    Value = 9},
		{Label = 'Chapeau N°',    Value = 10},
		{Label = 'Chapeau N°',    Value = 11},
		{Label = 'Chapeau N°',    Value = 12},
		{Label = 'Chapeau N°',    Value = 13},
		{Label = 'Chapeau N°',    Value = 14},
		{Label = 'Chapeau N°',    Value = 15},
		{Label = 'Chapeau N°',    Value = 16},
		{Label = 'Chapeau N°',    Value = 17},
		{Label = 'Chapeau N°',    Value = 18},
		{Label = 'Chapeau N°',    Value = 19},
		{Label = 'Chapeau N°',    Value = 20},
		{Label = 'Chapeau N°',    Value = 21},
		{Label = 'Chapeau N°',    Value = 22},
		{Label = 'Chapeau N°',    Value = 23},
		{Label = 'Chapeau N°',    Value = 24},
		{Label = 'Chapeau N°',    Value = 25},
		{Label = 'Chapeau N°',    Value = 26},
		{Label = 'Chapeau N°',    Value = 27},
		{Label = 'Chapeau N°',    Value = 28},
		{Label = 'Chapeau N°',    Value = 29},
		{Label = 'Chapeau N°',    Value = 30},
		{Label = 'Chapeau N°',    Value = 31},
		{Label = 'Chapeau N°',    Value = 32},
		{Label = 'Chapeau N°',    Value = 33},
		{Label = 'Chapeau N°',    Value = 34},
		{Label = 'Chapeau N°',    Value = 35},
		{Label = 'Chapeau N°',    Value = 36},
		{Label = 'Chapeau N°',    Value = 37},
		{Label = 'Chapeau N°',    Value = 38},
		{Label = 'Chapeau N°',    Value = 39},
		{Label = 'Chapeau N°',    Value = 40},
		{Label = 'Chapeau N°',    Value = 41},
		{Label = 'Chapeau N°',    Value = 42},
		{Label = 'Chapeau N°',    Value = 43},
		{Label = 'Chapeau N°',    Value = 44},
		{Label = 'Chapeau N°',    Value = 45},
		{Label = 'Chapeau N°',    Value = 46},
		{Label = 'Chapeau N°',    Value = 47},
		{Label = 'Chapeau N°',    Value = 48},
		{Label = 'Chapeau N°',    Value = 49},
		{Label = 'Chapeau N°',    Value = 50},
		{Label = 'Chapeau N°',    Value = 51},
		{Label = 'Chapeau N°',    Value = 52},
		{Label = 'Chapeau N°',    Value = 53},
		{Label = 'Chapeau N°',    Value = 54},
		{Label = 'Chapeau N°',    Value = 55},
		{Label = 'Chapeau N°',    Value = 56},
		{Label = 'Chapeau N°',    Value = 57},
		{Label = 'Chapeau N°',    Value = 58},
		{Label = 'Chapeau N°',    Value = 59},
		{Label = 'Chapeau N°',    Value = 60},
		{Label = 'Chapeau N°',    Value = 61},
		{Label = 'Chapeau N°',    Value = 62},
		{Label = 'Chapeau N°',    Value = 63},
		{Label = 'Chapeau N°',    Value = 64},
		{Label = 'Chapeau N°',    Value = 65},
		{Label = 'Chapeau N°',    Value = 66},
		{Label = 'Chapeau N°',    Value = 67},
		{Label = 'Chapeau N°',    Value = 68},
		{Label = 'Chapeau N°',    Value = 69},
		{Label = 'Chapeau N°',    Value = 70},
		{Label = 'Chapeau N°',    Value = 71},
		{Label = 'Chapeau N°',    Value = 72},
		{Label = 'Chapeau N°',    Value = 73},
		{Label = 'Chapeau N°',    Value = 74},
		{Label = 'Chapeau N°',    Value = 75},
		{Label = 'Chapeau N°',    Value = 76},
		{Label = 'Chapeau N°',    Value = 77},
		{Label = 'Chapeau N°',    Value = 78},
		{Label = 'Chapeau N°',    Value = 79},
		{Label = 'Chapeau N°',    Value = 80},
		{Label = 'Chapeau N°',    Value = 81},
		{Label = 'Chapeau N°',    Value = 82},
		{Label = 'Chapeau N°',    Value = 83},
		{Label = 'Chapeau N°',    Value = 84},
		{Label = 'Chapeau N°',    Value = 85},
		{Label = 'Chapeau N°',    Value = 86},
		{Label = 'Chapeau N°',    Value = 87},
		{Label = 'Chapeau N°',    Value = 88},
		{Label = 'Chapeau N°',    Value = 89},
		{Label = 'Chapeau N°',    Value = 90},
		{Label = 'Chapeau N°',    Value = 91},
		{Label = 'Chapeau N°',    Value = 92},
		{Label = 'Chapeau N°',    Value = 93},
		{Label = 'Chapeau N°',    Value = 94},
		{Label = 'Chapeau N°',    Value = 95},
		{Label = 'Chapeau N°',    Value = 96},
		{Label = 'Chapeau N°',    Value = 97},
		{Label = 'Chapeau N°',    Value = 98},
		{Label = 'Chapeau N°',    Value = 99},
		{Label = 'Chapeau N°',    Value = 100},
		{Label = 'Chapeau N°',    Value = 101},
		{Label = 'Chapeau N°',    Value = 102},
		{Label = 'Chapeau N°',    Value = 103},
		{Label = 'Chapeau N°',    Value = 104},
		{Label = 'Chapeau N°',    Value = 105},
		{Label = 'Chapeau N°',    Value = 106},
		{Label = 'Chapeau N°',    Value = 107},
		{Label = 'Chapeau N°',    Value = 108},
		{Label = 'Chapeau N°',    Value = 109},
		{Label = 'Chapeau N°',    Value = 110},
		{Label = 'Chapeau N°',    Value = 111},
		{Label = 'Chapeau N°',    Value = 112},
		{Label = 'Chapeau N°',    Value = 113},
		{Label = 'Chapeau N°',    Value = 114},
		{Label = 'Chapeau N°',    Value = 115},
		{Label = 'Chapeau N°',    Value = 116},
		{Label = 'Chapeau N°',    Value = 117},
		{Label = 'Chapeau N°',    Value = 118},
		{Label = 'Chapeau N°',    Value = 119},
		{Label = 'Chapeau N°',    Value = 120},
		{Label = 'Chapeau N°',    Value = 121},
		{Label = 'Chapeau N°',    Value = 122},
		{Label = 'Chapeau N°',    Value = 123},
		{Label = 'Chapeau N°',    Value = 124},
		{Label = 'Chapeau N°',    Value = 125},
		{Label = 'Chapeau N°',    Value = 126},
		{Label = 'Chapeau N°',    Value = 127},
		{Label = 'Chapeau N°',    Value = 128},
		{Label = 'Chapeau N°',    Value = 129},
		{Label = 'Chapeau N°',    Value = 130},
		{Label = 'Chapeau N°',    Value = 131},
		{Label = 'Chapeau N°',    Value = 132},
		{Label = 'Chapeau N°',    Value = 133},
		{Label = 'Chapeau N°',    Value = 134},
		{Label = 'Chapeau N°',    Value = 135},
		{Label = 'Chapeau N°',    Value = 136},
		{Label = 'Chapeau N°',    Value = 137},
		{Label = 'Chapeau N°',    Value = 138},
		{Label = 'Chapeau N°',    Value = 139},
		{Label = 'Chapeau N°',    Value = 140},
		{Label = 'Chapeau N°',    Value = 141},
		{Label = 'Chapeau N°',    Value = 142},
		{Label = 'Chapeau N°',    Value = 143},
		{Label = 'Chapeau N°',    Value = 144},
		{Label = 'Chapeau N°',    Value = 145},
		{Label = 'Chapeau N°',    Value = 146},
		{Label = 'Chapeau N°',    Value = 147},
		{Label = 'Chapeau N°',    Value = 148},
		{Label = 'Chapeau N°',    Value = 149},
		{Label = 'Chapeau N°',    Value = 150},
		{Label = 'Chapeau N°',    Value = 151},
		{Label = 'Chapeau N°',    Value = 152}
	},
	
	Masque = {
		{Label = 'Masque N°',    Value = 0},
		{Label = 'Masque N°',    Value = 1},
		{Label = 'Masque N°',    Value = 2},
		{Label = 'Masque N°',    Value = 3},
		{Label = 'Masque N°',    Value = 4},
		{Label = 'Masque N°',    Value = 5},
		{Label = 'Masque N°',    Value = 6},
		{Label = 'Masque N°',    Value = 7},
		{Label = 'Masque N°',    Value = 8},
		{Label = 'Masque N°',    Value = 9},
		{Label = 'Masque N°',    Value = 10},
		{Label = 'Masque N°',    Value = 11},
		{Label = 'Masque N°',    Value = 12},
		{Label = 'Masque N°',    Value = 13},
		{Label = 'Masque N°',    Value = 14},
		{Label = 'Masque N°',    Value = 15},
		{Label = 'Masque N°',    Value = 16},
		{Label = 'Masque N°',    Value = 17},
		{Label = 'Masque N°',    Value = 18},
		{Label = 'Masque N°',    Value = 19},
		{Label = 'Masque N°',    Value = 20},
		{Label = 'Masque N°',    Value = 21},
		{Label = 'Masque N°',    Value = 22},
		{Label = 'Masque N°',    Value = 23},
		{Label = 'Masque N°',    Value = 24},
		{Label = 'Masque N°',    Value = 25},
		{Label = 'Masque N°',    Value = 26},
		{Label = 'Masque N°',    Value = 27},
		{Label = 'Masque N°',    Value = 28},
		{Label = 'Masque N°',    Value = 29},
		{Label = 'Masque N°',    Value = 30},
		{Label = 'Masque N°',    Value = 31},
		{Label = 'Masque N°',    Value = 32},
		{Label = 'Masque N°',    Value = 33},
		{Label = 'Masque N°',    Value = 34},
		{Label = 'Masque N°',    Value = 35},
		{Label = 'Masque N°',    Value = 36},
		{Label = 'Masque N°',    Value = 37},
		{Label = 'Masque N°',    Value = 38},
		{Label = 'Masque N°',    Value = 39},
		{Label = 'Masque N°',    Value = 40},
		{Label = 'Masque N°',    Value = 41},
		{Label = 'Masque N°',    Value = 42},
		{Label = 'Masque N°',    Value = 43},
		{Label = 'Masque N°',    Value = 44},
		{Label = 'Masque N°',    Value = 45},
		{Label = 'Masque N°',    Value = 46},
		{Label = 'Masque N°',    Value = 47},
		{Label = 'Masque N°',    Value = 48},
		{Label = 'Masque N°',    Value = 49},
		{Label = 'Masque N°',    Value = 50},
		{Label = 'Masque N°',    Value = 51},
		{Label = 'Masque N°',    Value = 52},
		{Label = 'Masque N°',    Value = 53},
		{Label = 'Masque N°',    Value = 54},
		{Label = 'Masque N°',    Value = 55},
		{Label = 'Masque N°',    Value = 56},
		{Label = 'Masque N°',    Value = 57},
		{Label = 'Masque N°',    Value = 58},
		{Label = 'Masque N°',    Value = 59},
		{Label = 'Masque N°',    Value = 60},
		{Label = 'Masque N°',    Value = 61},
		{Label = 'Masque N°',    Value = 62},
		{Label = 'Masque N°',    Value = 63},
		{Label = 'Masque N°',    Value = 64},
		{Label = 'Masque N°',    Value = 65},
		{Label = 'Masque N°',    Value = 66},
		{Label = 'Masque N°',    Value = 67},
		{Label = 'Masque N°',    Value = 68},
		{Label = 'Masque N°',    Value = 69},
		{Label = 'Masque N°',    Value = 70},
		{Label = 'Masque N°',    Value = 71},
		{Label = 'Masque N°',    Value = 72},
		{Label = 'Masque N°',    Value = 73},
		{Label = 'Masque N°',    Value = 74},
		{Label = 'Masque N°',    Value = 75},
		{Label = 'Masque N°',    Value = 76},
		{Label = 'Masque N°',    Value = 77},
		{Label = 'Masque N°',    Value = 78},
		{Label = 'Masque N°',    Value = 79},
		{Label = 'Masque N°',    Value = 80},
		{Label = 'Masque N°',    Value = 81},
		{Label = 'Masque N°',    Value = 82},
		{Label = 'Masque N°',    Value = 83},
		{Label = 'Masque N°',    Value = 84},
		{Label = 'Masque N°',    Value = 85},
		{Label = 'Masque N°',    Value = 86},
		{Label = 'Masque N°',    Value = 87},
		{Label = 'Masque N°',    Value = 88},
		{Label = 'Masque N°',    Value = 89},
		{Label = 'Masque N°',    Value = 90},
		{Label = 'Masque N°',    Value = 91},
		{Label = 'Masque N°',    Value = 92},
		{Label = 'Masque N°',    Value = 93},
		{Label = 'Masque N°',    Value = 94},
		{Label = 'Masque N°',    Value = 95},
		{Label = 'Masque N°',    Value = 96},
		{Label = 'Masque N°',    Value = 97},
		{Label = 'Masque N°',    Value = 98},
		{Label = 'Masque N°',    Value = 99},
		{Label = 'Masque N°',    Value = 100},
		{Label = 'Masque N°',    Value = 101},
		{Label = 'Masque N°',    Value = 102},
		{Label = 'Masque N°',    Value = 103},
		{Label = 'Masque N°',    Value = 104},
		{Label = 'Masque N°',    Value = 105},
		{Label = 'Masque N°',    Value = 106},
		{Label = 'Masque N°',    Value = 107},
		{Label = 'Masque N°',    Value = 108},
		{Label = 'Masque N°',    Value = 109},
		{Label = 'Masque N°',    Value = 110},
		{Label = 'Masque N°',    Value = 111},
		{Label = 'Masque N°',    Value = 112},
		{Label = 'Masque N°',    Value = 113},
		{Label = 'Masque N°',    Value = 114},
		{Label = 'Masque N°',    Value = 115},
		{Label = 'Masque N°',    Value = 116},
		{Label = 'Masque N°',    Value = 117},
		{Label = 'Masque N°',    Value = 118},
		{Label = 'Masque N°',    Value = 119},
		{Label = 'Masque N°',    Value = 120},
		{Label = 'Masque N°',    Value = 121},
		{Label = 'Masque N°',    Value = 122},
		{Label = 'Masque N°',    Value = 123},
		{Label = 'Masque N°',    Value = 124},
		{Label = 'Masque N°',    Value = 125},
		{Label = 'Masque N°',    Value = 126},
		{Label = 'Masque N°',    Value = 127},
		{Label = 'Masque N°',    Value = 128},
		{Label = 'Masque N°',    Value = 129},
		{Label = 'Masque N°',    Value = 130},
		{Label = 'Masque N°',    Value = 131},
		{Label = 'Masque N°',    Value = 132},
		{Label = 'Masque N°',    Value = 133},
		{Label = 'Masque N°',    Value = 134},
		{Label = 'Masque N°',    Value = 135},
		{Label = 'Masque N°',    Value = 136},
		{Label = 'Masque N°',    Value = 137},
		{Label = 'Masque N°',    Value = 138},
		{Label = 'Masque N°',    Value = 139},
		{Label = 'Masque N°',    Value = 140},
		{Label = 'Masque N°',    Value = 141},
		{Label = 'Masque N°',    Value = 142},
		{Label = 'Masque N°',    Value = 143},
		{Label = 'Masque N°',    Value = 144},
		{Label = 'Masque N°',    Value = 145},
		{Label = 'Masque N°',    Value = 146},
		{Label = 'Masque N°',    Value = 147},
		{Label = 'Masque N°',    Value = 148},
		{Label = 'Masque N°',    Value = 149},
		{Label = 'Masque N°',    Value = 150},
		{Label = 'Masque N°',    Value = 151},
		{Label = 'Masque N°',    Value = 152},
		{Label = 'Masque N°',    Value = 153},
		{Label = 'Masque N°',    Value = 154},
		{Label = 'Masque N°',    Value = 155},
		{Label = 'Masque N°',    Value = 156},
		{Label = 'Masque N°',    Value = 157},
		{Label = 'Masque N°',    Value = 158},
		{Label = 'Masque N°',    Value = 159},
		{Label = 'Masque N°',    Value = 160},
		{Label = 'Masque N°',    Value = 161},
		{Label = 'Masque N°',    Value = 162},
		{Label = 'Masque N°',    Value = 163},
		{Label = 'Masque N°',    Value = 164},
		{Label = 'Masque N°',    Value = 165},
		{Label = 'Masque N°',    Value = 166},
		{Label = 'Masque N°',    Value = 167},
		{Label = 'Masque N°',    Value = 168},
		{Label = 'Masque N°',    Value = 169},
		{Label = 'Masque N°',    Value = 170},
		{Label = 'Masque N°',    Value = 171},
		{Label = 'Masque N°',    Value = 172},
		{Label = 'Masque N°',    Value = 173},
		{Label = 'Masque N°',    Value = 174},
		{Label = 'Masque N°',    Value = 175},
		{Label = 'Masque N°',    Value = 176},
		{Label = 'Masque N°',    Value = 177},
		{Label = 'Masque N°',    Value = 178},
		{Label = 'Masque N°',    Value = 179},
		{Label = 'Masque N°',    Value = 180},
		{Label = 'Masque N°',    Value = 181},
		{Label = 'Masque N°',    Value = 182},
		{Label = 'Masque N°',    Value = 183},
		{Label = 'Masque N°',    Value = 184},
		{Label = 'Masque N°',    Value = 185},
		{Label = 'Masque N°',    Value = 186},
		{Label = 'Masque N°',    Value = 187},
		{Label = 'Masque N°',    Value = 188},
		{Label = 'Masque N°',    Value = 189},
		{Label = 'Masque N°',    Value = 190},
		{Label = 'Masque N°',    Value = 191},
		{Label = 'Masque N°',    Value = 192},
		{Label = 'Masque N°',    Value = 193},
		{Label = 'Masque N°',    Value = 194},
		{Label = 'Masque N°',    Value = 195},
		{Label = 'Masque N°',    Value = 196},
		{Label = 'Masque N°',    Value = 197},
		{Label = 'Masque N°',    Value = 198},
		{Label = 'Masque N°',    Value = 199},
		{Label = 'Masque N°',    Value = 200},
		{Label = 'Masque N°',    Value = 201},
		{Label = 'Masque N°',    Value = 202},
		{Label = 'Masque N°',    Value = 203},
		{Label = 'Masque N°',    Value = 204},
		{Label = 'Masque N°',    Value = 205},
		{Label = 'Masque N°',    Value = 206},
		{Label = 'Masque N°',    Value = 207},
		{Label = 'Masque N°',    Value = 208},
		{Label = 'Masque N°',    Value = 209},
		{Label = 'Masque N°',    Value = 210},
		{Label = 'Masque N°',    Value = 211},
		{Label = 'Masque N°',    Value = 212},
		{Label = 'Masque N°',    Value = 213},
		{Label = 'Masque N°',    Value = 214},
		{Label = 'Masque N°',    Value = 215},
		{Label = 'Masque N°',    Value = 216},
		{Label = 'Masque N°',    Value = 217},
		{Label = 'Masque N°',    Value = 218},
		{Label = 'Masque N°',    Value = 219},
		{Label = 'Masque N°',    Value = 220},
		{Label = 'Masque N°',    Value = 221},
		{Label = 'Masque N°',    Value = 222},
		{Label = 'Masque N°',    Value = 223},
		{Label = 'Masque N°',    Value = 224},
		{Label = 'Masque N°',    Value = 225},
		{Label = 'Masque N°',    Value = 226},
		{Label = 'Masque N°',    Value = 227},
		{Label = 'Masque N°',    Value = 228},
		{Label = 'Masque N°',    Value = 229},
		{Label = 'Masque N°',    Value = 230},
		{Label = 'Masque N°',    Value = 231},
		{Label = 'Masque N°',    Value = 232},
		{Label = 'Masque N°',    Value = 233},
		{Label = 'Masque N°',    Value = 234},
		{Label = 'Masque N°',    Value = 235},
		{Label = 'Masque N°',    Value = 236},
		{Label = 'Masque N°',    Value = 237},
		{Label = 'Masque N°',    Value = 238}
	},
	
	Chaine = {
		{Label = 'Chaine N°',    Value = 0},
		{Label = 'Chaine N°',    Value = 1},
		{Label = 'Chaine N°',    Value = 2},
		{Label = 'Chaine N°',    Value = 3},
		{Label = 'Chaine N°',    Value = 4},
		{Label = 'Chaine N°',    Value = 5},
		{Label = 'Chaine N°',    Value = 6},
		{Label = 'Chaine N°',    Value = 7},
		{Label = 'Chaine N°',    Value = 8},
		{Label = 'Chaine N°',    Value = 9},
		{Label = 'Chaine N°',    Value = 10},
		{Label = 'Chaine N°',    Value = 11},
		{Label = 'Chaine N°',    Value = 12},
		{Label = 'Chaine N°',    Value = 13},
		{Label = 'Chaine N°',    Value = 14},
		{Label = 'Chaine N°',    Value = 15},
		{Label = 'Chaine N°',    Value = 16},
		{Label = 'Chaine N°',    Value = 17},
		{Label = 'Chaine N°',    Value = 18},
		{Label = 'Chaine N°',    Value = 19},
		{Label = 'Chaine N°',    Value = 20},
		{Label = 'Chaine N°',    Value = 21},
		{Label = 'Chaine N°',    Value = 22},
		{Label = 'Chaine N°',    Value = 23},
		{Label = 'Chaine N°',    Value = 24},
		{Label = 'Chaine N°',    Value = 25},
		{Label = 'Chaine N°',    Value = 26},
		{Label = 'Chaine N°',    Value = 27},
		{Label = 'Chaine N°',    Value = 28},
		{Label = 'Chaine N°',    Value = 29},
		{Label = 'Chaine N°',    Value = 30},
		{Label = 'Chaine N°',    Value = 31},
		{Label = 'Chaine N°',    Value = 32},
		{Label = 'Chaine N°',    Value = 33},
		{Label = 'Chaine N°',    Value = 34},
		{Label = 'Chaine N°',    Value = 35},
		{Label = 'Chaine N°',    Value = 36},
		{Label = 'Chaine N°',    Value = 37},
		{Label = 'Chaine N°',    Value = 38},
		{Label = 'Chaine N°',    Value = 39},
		{Label = 'Chaine N°',    Value = 40},
		{Label = 'Chaine N°',    Value = 41},
		{Label = 'Chaine N°',    Value = 42},
		{Label = 'Chaine N°',    Value = 43},
		{Label = 'Chaine N°',    Value = 44},
		{Label = 'Chaine N°',    Value = 45},
		{Label = 'Chaine N°',    Value = 46},
		{Label = 'Chaine N°',    Value = 47},
		{Label = 'Chaine N°',    Value = 48},
		{Label = 'Chaine N°',    Value = 49},
		{Label = 'Chaine N°',    Value = 50},
		{Label = 'Chaine N°',    Value = 51},
		{Label = 'Chaine N°',    Value = 52},
		{Label = 'Chaine N°',    Value = 53},
		{Label = 'Chaine N°',    Value = 54},
		{Label = 'Chaine N°',    Value = 55},
		{Label = 'Chaine N°',    Value = 56},
		{Label = 'Chaine N°',    Value = 57},
		{Label = 'Chaine N°',    Value = 58},
		{Label = 'Chaine N°',    Value = 59},
		{Label = 'Chaine N°',    Value = 60},
		{Label = 'Chaine N°',    Value = 61},
		{Label = 'Chaine N°',    Value = 62},
		{Label = 'Chaine N°',    Value = 63},
		{Label = 'Chaine N°',    Value = 64},
		{Label = 'Chaine N°',    Value = 65},
		{Label = 'Chaine N°',    Value = 66},
		{Label = 'Chaine N°',    Value = 67},
		{Label = 'Chaine N°',    Value = 68},
		{Label = 'Chaine N°',    Value = 69},
		{Label = 'Chaine N°',    Value = 70},
		{Label = 'Chaine N°',    Value = 71},
		{Label = 'Chaine N°',    Value = 72},
		{Label = 'Chaine N°',    Value = 73},
		{Label = 'Chaine N°',    Value = 74},
		{Label = 'Chaine N°',    Value = 75},
		{Label = 'Chaine N°',    Value = 76},
		{Label = 'Chaine N°',    Value = 77},
		{Label = 'Chaine N°',    Value = 78},
		{Label = 'Chaine N°',    Value = 79},
		{Label = 'Chaine N°',    Value = 80},
		{Label = 'Chaine N°',    Value = 81},
		{Label = 'Chaine N°',    Value = 82},
		{Label = 'Chaine N°',    Value = 83},
		{Label = 'Chaine N°',    Value = 84},
		{Label = 'Chaine N°',    Value = 85},
		{Label = 'Chaine N°',    Value = 86},
		{Label = 'Chaine N°',    Value = 87},
		{Label = 'Chaine N°',    Value = 88},
		{Label = 'Chaine N°',    Value = 89},
		{Label = 'Chaine N°',    Value = 90},
		{Label = 'Chaine N°',    Value = 91},
		{Label = 'Chaine N°',    Value = 92},
		{Label = 'Chaine N°',    Value = 93},
		{Label = 'Chaine N°',    Value = 94},
		{Label = 'Chaine N°',    Value = 95},
		{Label = 'Chaine N°',    Value = 96},
		{Label = 'Chaine N°',    Value = 97},
		{Label = 'Chaine N°',    Value = 98},
		{Label = 'Chaine N°',    Value = 99},
		{Label = 'Chaine N°',    Value = 100},
		{Label = 'Chaine N°',    Value = 101},
		{Label = 'Chaine N°',    Value = 102},
		{Label = 'Chaine N°',    Value = 103},
		{Label = 'Chaine N°',    Value = 104},
		{Label = 'Chaine N°',    Value = 105},
		{Label = 'Chaine N°',    Value = 106},
		{Label = 'Chaine N°',    Value = 107},
		{Label = 'Chaine N°',    Value = 108},
		{Label = 'Chaine N°',    Value = 109},
		{Label = 'Chaine N°',    Value = 110},
		{Label = 'Chaine N°',    Value = 111},
		{Label = 'Chaine N°',    Value = 112},
		{Label = 'Chaine N°',    Value = 113},
		{Label = 'Chaine N°',    Value = 114},
		{Label = 'Chaine N°',    Value = 115},
		{Label = 'Chaine N°',    Value = 116},
		{Label = 'Chaine N°',    Value = 117},
		{Label = 'Chaine N°',    Value = 118},
		{Label = 'Chaine N°',    Value = 119},
		{Label = 'Chaine N°',    Value = 120},
		{Label = 'Chaine N°',    Value = 121},
		{Label = 'Chaine N°',    Value = 122},
		{Label = 'Chaine N°',    Value = 123},
		{Label = 'Chaine N°',    Value = 124},
		{Label = 'Chaine N°',    Value = 125},
		{Label = 'Chaine N°',    Value = 126},
		{Label = 'Chaine N°',    Value = 127},
		{Label = 'Chaine N°',    Value = 128},
		{Label = 'Chaine N°',    Value = 129},
		{Label = 'Chaine N°',    Value = 130},
		{Label = 'Chaine N°',    Value = 131},
		{Label = 'Chaine N°',    Value = 132},
		{Label = 'Chaine N°',    Value = 133},
		{Label = 'Chaine N°',    Value = 134},
		{Label = 'Chaine N°',    Value = 135},
		{Label = 'Chaine N°',    Value = 136},
		{Label = 'Chaine N°',    Value = 137},
		{Label = 'Chaine N°',    Value = 138},
		{Label = 'Chaine N°',    Value = 139},
		{Label = 'Chaine N°',    Value = 140},
		{Label = 'Chaine N°',    Value = 141},
		{Label = 'Chaine N°',    Value = 142},
		{Label = 'Chaine N°',    Value = 143},
		{Label = 'Chaine N°',    Value = 144},
		{Label = 'Chaine N°',    Value = 145},
		{Label = 'Chaine N°',    Value = 146},
		{Label = 'Chaine N°',    Value = 147},
		{Label = 'Chaine N°',    Value = 148},
		{Label = 'Chaine N°',    Value = 149},
		{Label = 'Chaine N°',    Value = 150},
		{Label = 'Chaine N°',    Value = 151},
		{Label = 'Chaine N°',    Value = 152},
		{Label = 'Chaine N°',    Value = 153},
		{Label = 'Chaine N°',    Value = 154},
		{Label = 'Chaine N°',    Value = 155},
		{Label = 'Chaine N°',    Value = 156},
		{Label = 'Chaine N°',    Value = 157},
		{Label = 'Chaine N°',    Value = 158},
		{Label = 'Chaine N°',    Value = 159},
		{Label = 'Chaine N°',    Value = 160},
		{Label = 'Chaine N°',    Value = 161},
		{Label = 'Chaine N°',    Value = 162},
		{Label = 'Chaine N°',    Value = 163},
		{Label = 'Chaine N°',    Value = 164},
		{Label = 'Chaine N°',    Value = 165},
		{Label = 'Chaine N°',    Value = 166},
		{Label = 'Chaine N°',    Value = 167},
		{Label = 'Chaine N°',    Value = 168},
		{Label = 'Chaine N°',    Value = 169},
		{Label = 'Chaine N°',    Value = 170},
		{Label = 'Chaine N°',    Value = 171},
		{Label = 'Chaine N°',    Value = 172},
		{Label = 'Chaine N°',    Value = 173},
		{Label = 'Chaine N°',    Value = 174},
		{Label = 'Chaine N°',    Value = 175},
		{Label = 'Chaine N°',    Value = 176},
		{Label = 'Chaine N°',    Value = 177},
		{Label = 'Chaine N°',    Value = 178},
		{Label = 'Chaine N°',    Value = 179},
		{Label = 'Chaine N°',    Value = 180},
		{Label = 'Chaine N°',    Value = 181},
		{Label = 'Chaine N°',    Value = 182},
		{Label = 'Chaine N°',    Value = 183},
		{Label = 'Chaine N°',    Value = 184},
		{Label = 'Chaine N°',    Value = 185},
		{Label = 'Chaine N°',    Value = 186},
		{Label = 'Chaine N°',    Value = 187},
		{Label = 'Chaine N°',    Value = 188},
		{Label = 'Chaine N°',    Value = 189},
		{Label = 'Chaine N°',    Value = 190},
		{Label = 'Chaine N°',    Value = 191},
		{Label = 'Chaine N°',    Value = 192},
		{Label = 'Chaine N°',    Value = 193},
		{Label = 'Chaine N°',    Value = 194},
		{Label = 'Chaine N°',    Value = 195},
		{Label = 'Chaine N°',    Value = 196},
		{Label = 'Chaine N°',    Value = 197},
		{Label = 'Chaine N°',    Value = 198},
		{Label = 'Chaine N°',    Value = 199},
		{Label = 'Chaine N°',    Value = 200},
		{Label = 'Chaine N°',    Value = 201},
		{Label = 'Chaine N°',    Value = 202},
		{Label = 'Chaine N°',    Value = 203},
		{Label = 'Chaine N°',    Value = 204},
		{Label = 'Chaine N°',    Value = 205},
		{Label = 'Chaine N°',    Value = 206},
		{Label = 'Chaine N°',    Value = 207},
		{Label = 'Chaine N°',    Value = 208},
		{Label = 'Chaine N°',    Value = 209},
		{Label = 'Chaine N°',    Value = 210},
		{Label = 'Chaine N°',    Value = 211},
		{Label = 'Chaine N°',    Value = 212},
		{Label = 'Chaine N°',    Value = 213},
		{Label = 'Chaine N°',    Value = 214},
		{Label = 'Chaine N°',    Value = 215},
		{Label = 'Chaine N°',    Value = 216},
		{Label = 'Chaine N°',    Value = 217},
		{Label = 'Chaine N°',    Value = 218},
		{Label = 'Chaine N°',    Value = 219},
		{Label = 'Chaine N°',    Value = 220},
		{Label = 'Chaine N°',    Value = 221},
		{Label = 'Chaine N°',    Value = 222},
		{Label = 'Chaine N°',    Value = 223},
		{Label = 'Chaine N°',    Value = 224},
		{Label = 'Chaine N°',    Value = 225},
		{Label = 'Chaine N°',    Value = 226},
		{Label = 'Chaine N°',    Value = 227},
		{Label = 'Chaine N°',    Value = 228},
		{Label = 'Chaine N°',    Value = 229},
		{Label = 'Chaine N°',    Value = 230},
		{Label = 'Chaine N°',    Value = 231},
		{Label = 'Chaine N°',    Value = 232},
		{Label = 'Chaine N°',    Value = 233},
		{Label = 'Chaine N°',    Value = 234},
		{Label = 'Chaine N°',    Value = 235},
		{Label = 'Chaine N°',    Value = 236},
		{Label = 'Chaine N°',    Value = 237},
		{Label = 'Chaine N°',    Value = 238},
		{Label = 'Chaine N°',    Value = 239},
		{Label = 'Chaine N°',    Value = 240},
		{Label = 'Chaine N°',    Value = 241},
		{Label = 'Chaine N°',    Value = 242},
		{Label = 'Chaine N°',    Value = 243},
		{Label = 'Chaine N°',    Value = 244},
		{Label = 'Chaine N°',    Value = 245},
		{Label = 'Chaine N°',    Value = 246},
		{Label = 'Chaine N°',    Value = 247},
		{Label = 'Chaine N°',    Value = 248},
		{Label = 'Chaine N°',    Value = 249},
		{Label = 'Chaine N°',    Value = 250},
		{Label = 'Chaine N°',    Value = 251},
		{Label = 'Chaine N°',    Value = 252},
		{Label = 'Chaine N°',    Value = 253},
		{Label = 'Chaine N°',    Value = 254},
		{Label = 'Chaine N°',    Value = 255},
		{Label = 'Chaine N°',    Value = 256},
		{Label = 'Chaine N°',    Value = 257},
		{Label = 'Chaine N°',    Value = 258},
		{Label = 'Chaine N°',    Value = 259},
		{Label = 'Chaine N°',    Value = 260},
		{Label = 'Chaine N°',    Value = 261},
		{Label = 'Chaine N°',    Value = 262},
		{Label = 'Chaine N°',    Value = 263}
	},

    Oreille = {
		{Label = 'Boucle d\'oreilles N°',    Value = 0},
		{Label = 'Boucle d\'oreilles N°',    Value = 1},
		{Label = 'Boucle d\'oreilles N°',    Value = 2},
		{Label = 'Boucle d\'oreilles N°',    Value = 3},
		{Label = 'Boucle d\'oreilles N°',    Value = 4},
		{Label = 'Boucle d\'oreilles N°',    Value = 5},
		{Label = 'Boucle d\'oreilles N°',    Value = 6},
		{Label = 'Boucle d\'oreilles N°',    Value = 7},
		{Label = 'Boucle d\'oreilles N°',    Value = 8},
		{Label = 'Boucle d\'oreilles N°',    Value = 9},
		{Label = 'Boucle d\'oreilles N°',    Value = 10},
		{Label = 'Boucle d\'oreilles N°',    Value = 11},
		{Label = 'Boucle d\'oreilles N°',    Value = 12},
		{Label = 'Boucle d\'oreilles N°',    Value = 13},
		{Label = 'Boucle d\'oreilles N°',    Value = 14},
		{Label = 'Boucle d\'oreilles N°',    Value = 15},
		{Label = 'Boucle d\'oreilles N°',    Value = 16},
		{Label = 'Boucle d\'oreilles N°',    Value = 17},
		{Label = 'Boucle d\'oreilles N°',    Value = 18},
		{Label = 'Boucle d\'oreilles N°',    Value = 19},
		{Label = 'Boucle d\'oreilles N°',    Value = 20},
		{Label = 'Boucle d\'oreilles N°',    Value = 21},
		{Label = 'Boucle d\'oreilles N°',    Value = 22},
		{Label = 'Boucle d\'oreilles N°',    Value = 23},
		{Label = 'Boucle d\'oreilles N°',    Value = 24},
		{Label = 'Boucle d\'oreilles N°',    Value = 25},
		{Label = 'Boucle d\'oreilles N°',    Value = 26},
		{Label = 'Boucle d\'oreilles N°',    Value = 27},
		{Label = 'Boucle d\'oreilles N°',    Value = 28},
		{Label = 'Boucle d\'oreilles N°',    Value = 29},
		{Label = 'Boucle d\'oreilles N°',    Value = 30},
		{Label = 'Boucle d\'oreilles N°',    Value = 31},
		{Label = 'Boucle d\'oreilles N°',    Value = 32},
		{Label = 'Boucle d\'oreilles N°',    Value = 33}
    },

	Menu = {
		{Label = '~g~Équiper~w~',    Value = 1},
		{Label = '~b~Renommer~w~',    Value = 2},
		{Label = '~b~Donner~w~',    Value = 3},
		{Label = '~r~Supprimer~w~',    Value = 4}
    }
}

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

Panel = {
	ColourPanel = {
        index_one = 1,
        index_two = 1,
        Color = RageUI.PanelColour.HairCut
	},

	ColourPanel2 = {
        index_one = 1,
        index_two = 1,
        Color = RageUI.PanelColour.HairCut
	},
	
	PercentagePanel = {
		index = 0,
        itemIndex = 10,
        MinText = '0%',
        HeaderText = 'opacity',
        MaxText = '100%'
	}
}

local index = {
    checkbox = false,
    list = 1,
    heritage = 0.5,
    slider = 50,
    sliderprogress = 50,
    grid = {
        default = { x = 0.5, y = 0.5 },
        horizontal = { x = 0.5 },
        vertical = { y = 0.5 },
    },
    percentage = 0.5,
    color = {
        primary = { 1, 5 },
        secondary = { 1, 5 }
    },
}

pVet = {}

RegisterNetEvent('vet:reload')
AddEventHandler('vet:reload', function(table)
    pVet = table
end)

function OpenAccessMenu()
    local hautitems = RageUI.CreateMenu("Vos accessoires", "Accéssoires")

	RageUI.Visible(hautitems, not RageUI.Visible(hautitems))

	while hautitems do
        Citizen.Wait(0)

	RageUI.IsVisible(hautitems, function()
		RageUI.List('Enlever', {
			{ Name = "Masque", Value = 1 },
			{ Name = "Chapeau", Value = 2 },
			{ Name = "Lunette", Value = 3 },
			{ Name = "Boucle d'oreilles", Value = 4 },
		}, index.list, nil, {}, true, {
			onListChange = function(Index, Item)
				index.list = Index;
			end,
		
			onSelected = function(Index, Item)
				if Index == 1 then
					playerPed = GetPlayerPed(-1)
				TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
					local clothesSkin = {
			['mask_1'] = 0,   ['mask_2'] = 0
					}
					TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, clothesSkin)
					TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
				end)
				elseif Index == 2 then
					TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
						local clothesSkin = {
				        ['helmet_1'] = -1,   ['helmet_2'] = 0
						}
						TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, clothesSkin)
						TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
					end)
				elseif Index == 3 then
					playerPed = GetPlayerPed(-1)
					ClearPedProp(playerPed, 1)
				    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
					local clothesSkin = {
			        ['glasses_1'] = 0,   ['glasses_2'] = 0
					}
					TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, clothesSkin)
					TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
				    end)
				end
			end,
		})
		
		RageUI.Button('Masque', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveMask()
			end,
		});
		
		RageUI.Button('Chapeau', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveHat()
			end,
		});
		
		RageUI.Button('Lunettes', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveGlasses()
			end,
		});
	
		RageUI.Button('Chaine', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveChaine()
			end,
		});

		RageUI.Button('Sac', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveSac()
			end,
		});

		RageUI.Button('Boucle d\'oreilles', nil, {}, true, {
			onSelected = function()
			Wait(250)
                SaveEars()
			end,
		});
		RageUI.Separator()
    end, function()
end)
	
		if not RageUI.Visible(hautitems) then
			hautitems = RMenu:DeleteType('hautitems', true)
		end
	end
end

function SaveSac()
    local savesac = RageUI.CreateMenu("Sac", "Choisir")

	RageUI.Visible(savesac, not RageUI.Visible(savesac))

	while savesac do
        Citizen.Wait(0)

    RageUI.IsVisible(savesac, function()
        for k,v in pairs(pVet) do
            if v.type == 'Sac' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.bags_1
                            dos = k.bags_2
                            typos = v.type
                                if ped then
                                    local dict = 'random@domestic'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'pickup_low'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.bags_1, k.bags_2, 3)
                                TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                    skin.bags_1 = k.bags_1
                                    skin.bags_2 = k.bags_2
                                TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
                                TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                            end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(savesac) then
			savesac = RMenu:DeleteType('savesac', true)
		end
	end
end

function SaveGlasses()
    local saveglasses = RageUI.CreateMenu("Lunettes", "Choisir")

	RageUI.Visible(saveglasses, not RageUI.Visible(saveglasses))

	while saveglasses do
        Citizen.Wait(0)

    RageUI.IsVisible(saveglasses, function()
        for k,v in pairs(pVet) do
            if v.type == 'Lunette' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.glasses_1
                            dos = k.glasses_2
                            typos = v.type
                                if ped then
                                    local dict = 'clothingspecs'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'take_off'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.glasses_1, k.glasses_2, 3)
                                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                        skin.glasses_1 = k.glasses_1
                                        skin.glasses_2 = k.glasses_2
                                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                                end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(saveglasses) then
			saveglasses = RMenu:DeleteType('saveglasses', true)
		end
	end
end

function SaveHat()
    local savehat = RageUI.CreateMenu("Chapeau", "Choisir")

	RageUI.Visible(savehat, not RageUI.Visible(savehat))

	while savehat do
        Citizen.Wait(0)

    RageUI.IsVisible(savehat, function()
        for k,v in pairs(pVet) do
            if v.type == 'Chapeau' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.helmet_1
                            dos = k.helmet_2
                            typos = v.type
                                if ped then
                                    local dict = 'mp_masks@standard_car@ds@'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'put_on_mask'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.helmet_1, k.helmet_2, 3)
                                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                        skin.helmet_1 = k.helmet_1
                                        skin.helmet_2 = k.helmet_2
                                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                                end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(savehat) then
			savehat = RMenu:DeleteType('savehat', true)
		end
	end
end

function SaveMask()
    local savemask = RageUI.CreateMenu("Masque", "Choisir")

	RageUI.Visible(savemask, not RageUI.Visible(savemask))

	while savemask do
        Citizen.Wait(0)

    RageUI.IsVisible(savemask, function()
        for k,v in pairs(pVet) do
            if v.type == 'Masque' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.mask_1
                            dos = k.mask_2
                            typos = v.type
                                if ped then
                                    local dict = 'mp_masks@standard_car@ds@'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'put_on_mask'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.mask_1, k.mask_2, 3)
                                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                        skin.mask_1 = k.mask_1
                                        skin.mask_2 = k.mask_2
                                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                                end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(savemask) then
			savemask = RMenu:DeleteType('savemask', true)
		end
	end
end

function SaveChaine()
    local savechaine = RageUI.CreateMenu("Chaines", "Choisir")

	RageUI.Visible(savechaine, not RageUI.Visible(savechaine))

	while savechaine do
        Citizen.Wait(0)

    RageUI.IsVisible(savechaine, function()
        for k,v in pairs(pVet) do
            if v.type == 'Chaine' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.chain_1
                            dos = k.chain_2
                            typos = v.type
                                if ped then
                                    local dict = 'nmt_3_rcm-10'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'cs_nigel_dual-10'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.chain_1, k.chain_2, 3)
                                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                        skin.chain_1 = k.chain_1
                                        skin.chain_2 = k.chain_2
                                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                                end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(savechaine) then
			savechaine = RMenu:DeleteType('savechaine', true)
		end
	end
end

function SaveEars()
    local saveears = RageUI.CreateMenu("Boucle d'oreilles", "Choisir")

	RageUI.Visible(saveears, not RageUI.Visible(saveears))

	while saveears do
        Citizen.Wait(0)

    RageUI.IsVisible(saveears, function()
        for k,v in pairs(pVet) do
            if v.type == 'Oreilles' then
                RageUI.List(v.label, {
                    { Name = "~g~Équiper~w~", Value = 1 },
                    { Name = "~b~Renommer~w~", Value = 2 },
                    { Name = "~b~Donner~w~", Value = 3 },
                    { Name = "~r~Supprimer~w~", Value = 4 },
                }, index.list, description, {}, true, {
                    onListChange = function(Index, Item)
                        index.list = Index;
                    end,
                
                    onSelected = function(Index, Item)
                        if Index == 1 then
                            k = json.decode(v.mask)
                            ped = GetPlayerPed(-1)
                            uno = k.ears_1
                            dos = k.ears_2
                            typos = v.type
                                if ped then
                                    local dict = 'nmt_3_rcm-10'
                                    local myPed = PlayerPedId()
                                    RequestAnimDict(dict)
                            
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(0)
                                    end
                            
                                    local animation = ''
                                    local flags = 0 
                                    animation = 'cs_nigel_dual-10'
                                    TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
                                    Citizen.Wait(1000)
                                    SetEntityCollision(GetPlayerPed(-1), true, true)
                                    playerPed = GetPlayerPed(-1)
                                    SetPedComponentVariation(GetPlayerPed(-1), 3, k.ears_1, k.ears_2, 3)
                                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                                        skin.ears_1 = k.ears_1
                                        skin.ears_2 = k.ears_2
                                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
                                end)
                                Citizen.Wait(200)
                                ClearPedTasks(playerPed)
                            end
                
                        elseif Index == 2 then
                            label = KeyboardInput('Choisis le nom que tu souhaites', ('Surnom'), '', 10)
                            TriggerServerEvent("ewenclothe:RenameMasque", v.id, label, v.type)
                
                        elseif Index == 3 then
                            local myPed = PlayerPedId()
                            if v.id == 99 then
                                SetPedComponentVariation(playerPed, 1, 0, 0, 2)
                            else
                                ClearPedProp(myPed, v.index)
                            end
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local closestPed = GetPlayerPed(closestPlayer)
        
                            if IsPedSittingInAnyVehicle(closestPed) then
                                ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
                                return
                            end
        
                            if closestPlayer ~= -1 and closestDistance < 3.0 then
                                TriggerServerEvent('ewenclothe:GiveAccessories', GetPlayerServerId(closestPlayer), v.id, v.label)
                            else
                                ESX.ShowNotification("~r~Aucun joueurs proche")
        
                            end
                
                        elseif Index == 4 then
                            TriggerServerEvent('ewenclothe:Delclo', v.id, v.label)
                        end
                    end,
                })
            end
        end
    end, function()
    end)
	
		if not RageUI.Visible(saveears) then
			saveears = RMenu:DeleteType('saveears', true)
		end
	end
end

-----------------------------------------------------------------------------------------------------

function openAccessShop()
    local clotheshop = RageUI.CreateMenu("Magasin de vetements", "Changez votre style")

	RageUI.Visible(clotheshop, not RageUI.Visible(clotheshop))

	while clotheshop do
        Citizen.Wait(0)
		RageUI.IsVisible(clotheshop, function()
	
			RageUI.Button('Lunette', nil, {RightLabel = ">"}, true, {      
				onSelected = function()
				Wait(250) 	       
                    Glasses()
				end
			});

			RageUI.Button('Chapeau', nil, {RightLabel = ">"}, true, {      
				onSelected = function()  
				Wait(250)      
                    Hat()
				end
			});

			RageUI.Button('Masque', nil, {RightLabel = ">"}, true, {      
				onSelected = function() 
				Wait(250)       
                    Mask()
				end
			});

			RageUI.Button('Chaine', nil, {RightLabel = ">"}, true, {      
				onSelected = function() 
				Wait(250)       
                    Chaine()
				end
			});

            RageUI.Button('Sac', nil, {RightLabel = ">"}, true, {      
				onSelected = function()  
				Wait(250)      
                    Sac()
				end
			});

			RageUI.Button('Boucle d\'oreille', nil, {RightLabel = ">"}, true, {      
				onSelected = function() 
				Wait(250)       
                    Oreilles()
				end
			});
		end)
		
		if not RageUI.Visible(clotheshop) then
			clotheshop = RMenu:DeleteType('clotheshop', true)
		    ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Sac()
    local sac = RageUI.CreateMenu("Sac", "Sacs disponible")

	RageUI.Visible(sac, not RageUI.Visible(sac))

	while sac do
        Citizen.Wait(0)
		RageUI.IsVisible(sac, function()	

        for k, v in pairs(ClotheShop.Sac) do

			RageUI.List(v.Label .. '' .. v.Value, {
				{ Name = '0', Value = 0 },
				{ Name = '1', Value = 1 },
				{ Name = '2', Value = 2 },
				{ Name = '3', Value = 3 },
				{ Name = '4', Value = 4 },
				{ Name = '5', Value = 5 },
				{ Name = '6', Value = 6 },
				{ Name = '7', Value = 7 },
				{ Name = '8', Value = 8 },
				{ Name = '9', Value = 9 },
			}, index.list, description, {}, true, {
				onListChange = function(Index, Item)
					index.list = Index;
				end,

				onActive = function()
					SetPedComponentVariation(GetPlayerPed(-1), 5, v.Value, index.list - 1, 3)
				end,

				onSelected = function(Index, Item)
					TriggerServerEvent("ewenclothe:SetNewBag", v.Value, index.list - 1, 0, 0, 0, "Sac", v.Label .. '' .. v.Value, 1)
				end,
			})
	    end
    end, function()
    end)
	
		if not RageUI.Visible(sac) then
			sac = RMenu:DeleteType('sac', true)
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Glasses()
    local lunette = RageUI.CreateMenu("Lunettes", "Lunettes disponible")

	RageUI.Visible(lunette, not RageUI.Visible(lunette))

	while lunette do
        Citizen.Wait(0)
		RageUI.IsVisible(lunette, function()

        for k, v in pairs(ClotheShop.Lunette) do

			RageUI.List(v.Label .. '' .. v.Value, {
				{ Name = '0', Value = 0 },
				{ Name = '1', Value = 1 },
				{ Name = '2', Value = 2 },
				{ Name = '3', Value = 3 },
				{ Name = '4', Value = 4 },
				{ Name = '5', Value = 5 },
				{ Name = '6', Value = 6 },
				{ Name = '7', Value = 7 },
				{ Name = '8', Value = 8 },
				{ Name = '9', Value = 9 },
			}, index.list, description, {}, true, {
				onListChange = function(Index, Item)
					index.list = Index;
				end,

				onActive = function()
					SetPedPropIndex(GetPlayerPed(-1), 1, v.Value, index.list - 1, 2)
				end,

				onSelected = function(Index, Item)
					TriggerServerEvent("ewenclothe:SetNewGlasses", v.Value, index.list - 1, 0, 0, 0, "Lunette", v.Label .. '' .. v.Value, 1)
				end,
			})
	    end
    end, function()
    end)
	
		if not RageUI.Visible(lunette) then
			lunette = RMenu:DeleteType('lunette', true)
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Hat()
    local chapeau = RageUI.CreateMenu("Chapeaux", "Chapeaux disponible")

    RageUI.Visible(chapeau, not RageUI.Visible(chapeau))

    while chapeau do
        Citizen.Wait(0)
        RageUI.IsVisible(chapeau, function()

        for k, v in pairs(ClotheShop.Chapeau) do

			RageUI.List(v.Label .. '' .. v.Value, {
				{ Name = '0', Value = 0 },
				{ Name = '1', Value = 1 },
				{ Name = '2', Value = 2 },
				{ Name = '3', Value = 3 },
				{ Name = '4', Value = 4 },
				{ Name = '5', Value = 5 },
				{ Name = '6', Value = 6 },
				{ Name = '7', Value = 7 },
				{ Name = '8', Value = 8 },
				{ Name = '9', Value = 9 },
			}, index.list, description, {}, true, {
				onListChange = function(Index, Item)
					index.list = Index;
				end,

				onActive = function()
					SetPedPropIndex(GetPlayerPed(-1), 0, v.Value, index.list - 1, 2)
				end,

				onSelected = function(Index, Item)
					TriggerServerEvent("ewenclothe:SetNewHat", v.Value, index.list - 1, 0, 0, 0, "Chapeau", v.Label .. '' .. v.Value, 1)
				end,
			})
        end
    end, function()
    end)
    
        if not RageUI.Visible(chapeau) then
            chapeau = RMenu:DeleteType('chapeau', true)
            ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
            end)
        end
    end
end

function Mask()
    local masque = RageUI.CreateMenu("Masques", "Masques disponible")

	RageUI.Visible(masque, not RageUI.Visible(masque))

	while masque do
        Citizen.Wait(0)
		RageUI.IsVisible(masque, function()

        for k, v in pairs(ClotheShop.Masque) do


			RageUI.List(v.Label .. '' .. v.Value, {
				{ Name = '0', Value = 0 },
				{ Name = '1', Value = 1 },
				{ Name = '2', Value = 2 },
				{ Name = '3', Value = 3 },
				{ Name = '4', Value = 4 },
				{ Name = '5', Value = 5 },
				{ Name = '6', Value = 6 },
				{ Name = '7', Value = 7 },
				{ Name = '8', Value = 8 },
				{ Name = '9', Value = 9 },
			}, index.list, description, {}, true, {
				onListChange = function(Index, Item)
					index.list = Index;
				end,

				onActive = function()
					SetPedComponentVariation(GetPlayerPed(-1), 1, v.Value, index.list - 1, 3)
				end,

				onSelected = function(Index, Item)
					TriggerServerEvent("ewenclothe:SetNewMask", v.Value, index.list - 1, 0, 0, 0, "Masque", v.Label .. '' .. v.Value, 1)
				end,
			})
	    end
    end, function()
end)
	
		if not RageUI.Visible(masque) then
			masque = RMenu:DeleteType('masque', true)
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Chaine()
    local chaine = RageUI.CreateMenu("Chaines", "Chaines disponible")

	RageUI.Visible(chaine, not RageUI.Visible(chaine))

	while chaine do
        Citizen.Wait(0)
		RageUI.IsVisible(chaine, function()

        for k, v in pairs(ClotheShop.Chaine) do

			RageUI.List(v.Label .. '' .. v.Value, {
				{ Name = '0', Value = 0 },
				{ Name = '1', Value = 1 },
				{ Name = '2', Value = 2 },
				{ Name = '3', Value = 3 },
				{ Name = '4', Value = 4 },
				{ Name = '5', Value = 5 },
				{ Name = '6', Value = 6 },
				{ Name = '7', Value = 7 },
				{ Name = '8', Value = 8 },
				{ Name = '9', Value = 9 },
			}, index.list, description, {}, true, {
				onListChange = function(Index, Item)
					index.list = Index;
				end,

				onActive = function()
					SetPedComponentVariation(GetPlayerPed(-1), 7, v.Value, index.list - 1, 3)
				end,

				onSelected = function(Index, Item)
					TriggerServerEvent("ewenclothe:SetNewChaine", v.Value, index.list - 1, 0, 0, 0, "Chaine", v.Label .. '' .. v.Value, 1)
				end,
			})
	    end
    end, function()
end)
	
		if not RageUI.Visible(chaine) then
			chaine = RMenu:DeleteType('chaine', true)
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end



function Oreilles()
    local oreille = RageUI.CreateMenu("Boucles d\'oreilles", "Boucles d\'oreilles disponible")

	RageUI.Visible(oreille, not RageUI.Visible(oreille))

	while oreille do
        Citizen.Wait(0)
		RageUI.IsVisible(oreille, function()

        for k, v in pairs(ClotheShop.Oreille) do

				RageUI.List(v.Label .. '' .. v.Value, {
					{ Name = '0', Value = 0 },
					{ Name = '1', Value = 1 },
					{ Name = '2', Value = 2 },
					{ Name = '3', Value = 3 },
					{ Name = '4', Value = 4 },
					{ Name = '5', Value = 5 },
					{ Name = '6', Value = 6 },
					{ Name = '7', Value = 7 },
					{ Name = '8', Value = 8 },
					{ Name = '9', Value = 9 },
		}, index.list, description, {}, true, {
			onListChange = function(Index, Item)
				index.list = Index;
			end,

			onActive = function()
				SetPedPropIndex(GetPlayerPed(-1), 2, v.Value, index.list - 1, 2)
			end,

			onSelected = function(Index, Item)
				TriggerServerEvent("ewenclothe:SetNewOreilles", v.Value, index.list - 1, 0, 0, 0, "Oreilles", v.Label .. '' .. v.Value)
			end,
		})
	    end
    end, function()
end)
	
		if not RageUI.Visible(oreille) then
			oreille = RMenu:DeleteType('oreille', true)
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

Citizen.CreateThread(function()
    while not ESXLoaded do Wait(1) end
    TriggerServerEvent('framework:loadvet')
end)