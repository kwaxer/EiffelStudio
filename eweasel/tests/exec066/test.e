
--| Copyright (c) 1993-2006 University of Southern California and contributors.
--| All rights reserved.
--| Your use of this work is governed under the terms of the GNU General
--| Public License version 2.

class TEST
creation
	make

feature

	make (args: ARRAY [STRING]) is
		do
			weasel (args.item (1).to_integer, args.item (2).to_integer);
		end;

	weasel (count, len: INTEGER) is
		local
			s1: STRING;
			s2: STRING;
			s3: STRING;
			s4: STRING;
			s5: STRING;
			s6: STRING;
			s7: STRING;
			s8: STRING;
			s9: STRING;
			s10: STRING;
			s11: STRING;
			s12: STRING;
			s13: STRING;
			s14: STRING;
			s15: STRING;
			s16: STRING;
			s17: STRING;
			s18: STRING;
			s19: STRING;
			s20: STRING;
			s21: STRING;
			s22: STRING;
			s23: STRING;
			s24: STRING;
			s25: STRING;
			s26: STRING;
			s27: STRING;
			s28: STRING;
			s29: STRING;
			s30: STRING;
			s31: STRING;
			s32: STRING;
			s33: STRING;
			s34: STRING;
			s35: STRING;
			s36: STRING;
			s37: STRING;
			s38: STRING;
			s39: STRING;
			s40: STRING;
			s41: STRING;
			s42: STRING;
			s43: STRING;
			s44: STRING;
			s45: STRING;
			s46: STRING;
			s47: STRING;
			s48: STRING;
			s49: STRING;
			s50: STRING;
			s51: STRING;
			s52: STRING;
			s53: STRING;
			s54: STRING;
			s55: STRING;
			s56: STRING;
			s57: STRING;
			s58: STRING;
			s59: STRING;
			s60: STRING;
			s61: STRING;
			s62: STRING;
			s63: STRING;
			s64: STRING;
			s65: STRING;
			s66: STRING;
			s67: STRING;
			s68: STRING;
			s69: STRING;
			s70: STRING;
			s71: STRING;
			s72: STRING;
			s73: STRING;
			s74: STRING;
			s75: STRING;
			s76: STRING;
			s77: STRING;
			s78: STRING;
			s79: STRING;
			s80: STRING;
			s81: STRING;
			s82: STRING;
			s83: STRING;
			s84: STRING;
			s85: STRING;
			s86: STRING;
			s87: STRING;
			s88: STRING;
			s89: STRING;
			s90: STRING;
			s91: STRING;
			s92: STRING;
			s93: STRING;
			s94: STRING;
			s95: STRING;
			s96: STRING;
			s97: STRING;
			s98: STRING;
			s99: STRING;
			s100: STRING;
			s101: STRING;
			s102: STRING;
			s103: STRING;
			s104: STRING;
			s105: STRING;
			s106: STRING;
			s107: STRING;
			s108: STRING;
			s109: STRING;
			s110: STRING;
			s111: STRING;
			s112: STRING;
			s113: STRING;
			s114: STRING;
			s115: STRING;
			s116: STRING;
			s117: STRING;
			s118: STRING;
			s119: STRING;
			s120: STRING;
			s121: STRING;
			s122: STRING;
			s123: STRING;
			s124: STRING;
			s125: STRING;
			s126: STRING;
			s127: STRING;
			s128: STRING;
			s129: STRING;
			s130: STRING;
			s131: STRING;
			s132: STRING;
			s133: STRING;
			s134: STRING;
			s135: STRING;
			s136: STRING;
			s137: STRING;
			s138: STRING;
			s139: STRING;
			s140: STRING;
			s141: STRING;
			s142: STRING;
			s143: STRING;
			s144: STRING;
			s145: STRING;
			s146: STRING;
			s147: STRING;
			s148: STRING;
			s149: STRING;
			s150: STRING;
			s151: STRING;
			s152: STRING;
			s153: STRING;
			s154: STRING;
			s155: STRING;
			s156: STRING;
			s157: STRING;
			s158: STRING;
			s159: STRING;
			s160: STRING;
			s161: STRING;
			s162: STRING;
			s163: STRING;
			s164: STRING;
			s165: STRING;
			s166: STRING;
			s167: STRING;
			s168: STRING;
			s169: STRING;
			s170: STRING;
			s171: STRING;
			s172: STRING;
			s173: STRING;
			s174: STRING;
			s175: STRING;
			s176: STRING;
			s177: STRING;
			s178: STRING;
			s179: STRING;
			s180: STRING;
			s181: STRING;
			s182: STRING;
			s183: STRING;
			s184: STRING;
			s185: STRING;
			s186: STRING;
			s187: STRING;
			s188: STRING;
			s189: STRING;
			s190: STRING;
			s191: STRING;
			s192: STRING;
			s193: STRING;
			s194: STRING;
			s195: STRING;
			s196: STRING;
			s197: STRING;
			s198: STRING;
			s199: STRING;
			s200: STRING;
			s201: STRING;
			s202: STRING;
			s203: STRING;
			s204: STRING;
			s205: STRING;
			s206: STRING;
			s207: STRING;
			s208: STRING;
			s209: STRING;
			s210: STRING;
			s211: STRING;
			s212: STRING;
			s213: STRING;
			s214: STRING;
			s215: STRING;
			s216: STRING;
			s217: STRING;
			s218: STRING;
			s219: STRING;
			s220: STRING;
			s221: STRING;
			s222: STRING;
			s223: STRING;
			s224: STRING;
			s225: STRING;
			s226: STRING;
			s227: STRING;
			s228: STRING;
			s229: STRING;
			s230: STRING;
			s231: STRING;
			s232: STRING;
			s233: STRING;
			s234: STRING;
			s235: STRING;
			s236: STRING;
			s237: STRING;
			s238: STRING;
			s239: STRING;
			s240: STRING;
			s241: STRING;
			s242: STRING;
			s243: STRING;
			s244: STRING;
			s245: STRING;
			s246: STRING;
			s247: STRING;
			s248: STRING;
			s249: STRING;
			s250: STRING;
			s251: STRING;
			s252: STRING;
			s253: STRING;
			s254: STRING;
			s255: STRING;
		do
		    	io.putstring ("Entering weasel: ");
			io.putint (count); io.new_line;
			if count > 0 then
				!!s1.make (len + 1);
				!!s2.make (len + 2);
				!!s3.make (len + 3);
				!!s4.make (len + 4);
				!!s5.make (len + 5);
				!!s6.make (len + 6);
				!!s7.make (len + 7);
				!!s8.make (len + 8);
				!!s9.make (len + 9);
				!!s10.make (len + 10);
				!!s11.make (len + 11);
				!!s12.make (len + 12);
				!!s13.make (len + 13);
				!!s14.make (len + 14);
				!!s15.make (len + 15);
				!!s16.make (len + 16);
				!!s17.make (len + 17);
				!!s18.make (len + 18);
				!!s19.make (len + 19);
				!!s20.make (len + 20);
				!!s21.make (len + 21);
				!!s22.make (len + 22);
				!!s23.make (len + 23);
				!!s24.make (len + 24);
				!!s25.make (len + 25);
				!!s26.make (len + 26);
				!!s27.make (len + 27);
				!!s28.make (len + 28);
				!!s29.make (len + 29);
				!!s30.make (len + 30);
				!!s31.make (len + 31);
				!!s32.make (len + 32);
				!!s33.make (len + 33);
				!!s34.make (len + 34);
				!!s35.make (len + 35);
				!!s36.make (len + 36);
				!!s37.make (len + 37);
				!!s38.make (len + 38);
				!!s39.make (len + 39);
				!!s40.make (len + 40);
				!!s41.make (len + 41);
				!!s42.make (len + 42);
				!!s43.make (len + 43);
				!!s44.make (len + 44);
				!!s45.make (len + 45);
				!!s46.make (len + 46);
				!!s47.make (len + 47);
				!!s48.make (len + 48);
				!!s49.make (len + 49);
				!!s50.make (len + 50);
				!!s51.make (len + 51);
				!!s52.make (len + 52);
				!!s53.make (len + 53);
				!!s54.make (len + 54);
				!!s55.make (len + 55);
				!!s56.make (len + 56);
				!!s57.make (len + 57);
				!!s58.make (len + 58);
				!!s59.make (len + 59);
				!!s60.make (len + 60);
				!!s61.make (len + 61);
				!!s62.make (len + 62);
				!!s63.make (len + 63);
				!!s64.make (len + 64);
				!!s65.make (len + 65);
				!!s66.make (len + 66);
				!!s67.make (len + 67);
				!!s68.make (len + 68);
				!!s69.make (len + 69);
				!!s70.make (len + 70);
				!!s71.make (len + 71);
				!!s72.make (len + 72);
				!!s73.make (len + 73);
				!!s74.make (len + 74);
				!!s75.make (len + 75);
				!!s76.make (len + 76);
				!!s77.make (len + 77);
				!!s78.make (len + 78);
				!!s79.make (len + 79);
				!!s80.make (len + 80);
				!!s81.make (len + 81);
				!!s82.make (len + 82);
				!!s83.make (len + 83);
				!!s84.make (len + 84);
				!!s85.make (len + 85);
				!!s86.make (len + 86);
				!!s87.make (len + 87);
				!!s88.make (len + 88);
				!!s89.make (len + 89);
				!!s90.make (len + 90);
				!!s91.make (len + 91);
				!!s92.make (len + 92);
				!!s93.make (len + 93);
				!!s94.make (len + 94);
				!!s95.make (len + 95);
				!!s96.make (len + 96);
				!!s97.make (len + 97);
				!!s98.make (len + 98);
				!!s99.make (len + 99);
				!!s100.make (len + 100);
				!!s101.make (len + 101);
				!!s102.make (len + 102);
				!!s103.make (len + 103);
				!!s104.make (len + 104);
				!!s105.make (len + 105);
				!!s106.make (len + 106);
				!!s107.make (len + 107);
				!!s108.make (len + 108);
				!!s109.make (len + 109);
				!!s110.make (len + 110);
				!!s111.make (len + 111);
				!!s112.make (len + 112);
				!!s113.make (len + 113);
				!!s114.make (len + 114);
				!!s115.make (len + 115);
				!!s116.make (len + 116);
				!!s117.make (len + 117);
				!!s118.make (len + 118);
				!!s119.make (len + 119);
				!!s120.make (len + 120);
				!!s121.make (len + 121);
				!!s122.make (len + 122);
				!!s123.make (len + 123);
				!!s124.make (len + 124);
				!!s125.make (len + 125);
				!!s126.make (len + 126);
				!!s127.make (len + 127);
				!!s128.make (len + 128);
				!!s129.make (len + 129);
				!!s130.make (len + 130);
				!!s131.make (len + 131);
				!!s132.make (len + 132);
				!!s133.make (len + 133);
				!!s134.make (len + 134);
				!!s135.make (len + 135);
				!!s136.make (len + 136);
				!!s137.make (len + 137);
				!!s138.make (len + 138);
				!!s139.make (len + 139);
				!!s140.make (len + 140);
				!!s141.make (len + 141);
				!!s142.make (len + 142);
				!!s143.make (len + 143);
				!!s144.make (len + 144);
				!!s145.make (len + 145);
				!!s146.make (len + 146);
				!!s147.make (len + 147);
				!!s148.make (len + 148);
				!!s149.make (len + 149);
				!!s150.make (len + 150);
				!!s151.make (len + 151);
				!!s152.make (len + 152);
				!!s153.make (len + 153);
				!!s154.make (len + 154);
				!!s155.make (len + 155);
				!!s156.make (len + 156);
				!!s157.make (len + 157);
				!!s158.make (len + 158);
				!!s159.make (len + 159);
				!!s160.make (len + 160);
				!!s161.make (len + 161);
				!!s162.make (len + 162);
				!!s163.make (len + 163);
				!!s164.make (len + 164);
				!!s165.make (len + 165);
				!!s166.make (len + 166);
				!!s167.make (len + 167);
				!!s168.make (len + 168);
				!!s169.make (len + 169);
				!!s170.make (len + 170);
				!!s171.make (len + 171);
				!!s172.make (len + 172);
				!!s173.make (len + 173);
				!!s174.make (len + 174);
				!!s175.make (len + 175);
				!!s176.make (len + 176);
				!!s177.make (len + 177);
				!!s178.make (len + 178);
				!!s179.make (len + 179);
				!!s180.make (len + 180);
				!!s181.make (len + 181);
				!!s182.make (len + 182);
				!!s183.make (len + 183);
				!!s184.make (len + 184);
				!!s185.make (len + 185);
				!!s186.make (len + 186);
				!!s187.make (len + 187);
				!!s188.make (len + 188);
				!!s189.make (len + 189);
				!!s190.make (len + 190);
				!!s191.make (len + 191);
				!!s192.make (len + 192);
				!!s193.make (len + 193);
				!!s194.make (len + 194);
				!!s195.make (len + 195);
				!!s196.make (len + 196);
				!!s197.make (len + 197);
				!!s198.make (len + 198);
				!!s199.make (len + 199);
				!!s200.make (len + 200);
				!!s201.make (len + 201);
				!!s202.make (len + 202);
				!!s203.make (len + 203);
				!!s204.make (len + 204);
				!!s205.make (len + 205);
				!!s206.make (len + 206);
				!!s207.make (len + 207);
				!!s208.make (len + 208);
				!!s209.make (len + 209);
				!!s210.make (len + 210);
				!!s211.make (len + 211);
				!!s212.make (len + 212);
				!!s213.make (len + 213);
				!!s214.make (len + 214);
				!!s215.make (len + 215);
				!!s216.make (len + 216);
				!!s217.make (len + 217);
				!!s218.make (len + 218);
				!!s219.make (len + 219);
				!!s220.make (len + 220);
				!!s221.make (len + 221);
				!!s222.make (len + 222);
				!!s223.make (len + 223);
				!!s224.make (len + 224);
				!!s225.make (len + 225);
				!!s226.make (len + 226);
				!!s227.make (len + 227);
				!!s228.make (len + 228);
				!!s229.make (len + 229);
				!!s230.make (len + 230);
				!!s231.make (len + 231);
				!!s232.make (len + 232);
				!!s233.make (len + 233);
				!!s234.make (len + 234);
				!!s235.make (len + 235);
				!!s236.make (len + 236);
				!!s237.make (len + 237);
				!!s238.make (len + 238);
				!!s239.make (len + 239);
				!!s240.make (len + 240);
				!!s241.make (len + 241);
				!!s242.make (len + 242);
				!!s243.make (len + 243);
				!!s244.make (len + 244);
				!!s245.make (len + 245);
				!!s246.make (len + 246);
				!!s247.make (len + 247);
				!!s248.make (len + 248);
				!!s249.make (len + 249);
				!!s250.make (len + 250);
				!!s251.make (len + 251);
				!!s252.make (len + 252);
				!!s253.make (len + 253);
				!!s254.make (len + 254);
				!!s255.make (len + 255);
				weasel (count - 1, len);
			end
		    	io.putstring ("Leaving weasel%N");
		end;

end
