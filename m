Message-ID: <3DAD810B.3090105@netland.nl>
From: Ron Arts <raarts@netland.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM:
 bad  (LONG)
References: <3DAC940D.7010903@netland.nl> <20021016100622.A11693@sistina.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms070203070200070506030301"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Oct 17 10:51:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a cryptographically signed message in MIME format.

--------------ms070203070200070506030301
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Heinz,

thanks for your response. This reply is rather long due to including
lvdisplay and pvdisplay output...

Heinz J . Mauelshagen wrote:
> On Wed, Oct 16, 2002 at 12:17:49AM +0200, Ron Arts wrote:
> 
>>Hello,
>>
>>I am interested in performance for hardware/software RAID
>>in combination with LVM
>>
>>So I took a server (Dual Xeon 2.4GHz, 1Gb RAM), a RAID adapter,
>>some identical SCSI disks and configured it with several of these
>>options (using RH 8.0) and ran a few bonnie++ benchmarks.
>>
>>Results are below. Anyone care to comment? Especially LVM performance
>>disappointed here.
>>
>>LVM machine setup:
>>
>>2 18Gb disks. I created 3 partitions on both disks, 128Mb, 512Mb and 17Gb
>>Equal partitions were combined into RAID-1 devices (md driver).
>>First md device mounted on /boot, second for swapfile, and third
>>as basis for LVM
>>
>>Out of the volume group four LV were created and mounted as follows:
>>
>>[root@nbs-126 root]# df
>>Filesystem           1K-blocks      Used Available Use% Mounted on
>>/dev/vg0/root          4225092   1293064   2717400  33% /
>>/dev/md0                124323     11517    106387  10% /boot
>>/dev/vg0/home          4225092     32828   3977636   1% /home
>>none                    514996         0    514996   0% /dev/shm
>>/dev/vg0/var           4225092     51720   3958744   2% /var
>>/dev/vg0/mysql        16513960     32828  15642272   1% /var/lib/mysql
> 
> 
> Ron, I don't get your configuration by this df output :(
> 
> You've got 3 mirrored MDs on 2 disks (1st: 128Mb, 2nd: 512Mb, 3rd: 17Gb)
> 
> 3rd is used as the one and only physical volume (say /dev/md2)
> for volume group "vg0", right?
> 
> How comes that the grand total of /dev/vg0/{root, home, var, mysql}
> is ~27.84Gb when the volume group only holds the 17Gb of /dev/md2?
> 

Oops, sorry. All physical disks are 36 Gb, and indeed the volume group
holds 35Gb. It was late when I wrote this. Sorry.

> 
>>Is there a reason for the performance degradation I saw with LVM?
> 
> 
> If my above thoughts are correct, the logical volume(s) used could well be
> suffering from bad mapping onto disk(s). You can check the mapping with
> either "pvdisplay -v /dev/md2" or for eg. "lvdisplay -v /dev/vg00/root".


I'm unsure how to interpret the pvdisplay and lvdisplay output.

This is the output of pvdisplay -v /dev/md2:

--- Physical volume ---
PV Name               /dev/md2
VG Name               vg0
PV Size               33.56 GB [70380544 secs] / NOT usable 4.19 MB [LVM: 161 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                4
PE Size (KByte)       4096
Total PE              8590
Free PE               1350
Allocated PE          7240
PV UUID               YsIrFt-ep0A-nLxp-IjYS-8oic-JWyJ-sBrt1Q

    --- Distribution of physical volume ---
    LV Name                   LE of LV  PE for LV
    /dev/vg0/root             1048      1048
    /dev/vg0/home             1048      1048
    /dev/vg0/var              1048      1048
    /dev/vg0/mysql            4096      4096

    --- Physical extents ---
    PE    LV                        LE      Disk sector
    00000 /dev/vg0/root             00000   8576
    00001 /dev/vg0/root             00001   16768
    [ cut ... ]
    01046 /dev/vg0/root             01046   8577408
    01047 /dev/vg0/root             01047   8585600
    01048 /dev/vg0/home             00000   8593792
    01049 /dev/vg0/home             00001   8601984
    [ cut ... ]
    02094 /dev/vg0/home             01046   17162624
    02095 /dev/vg0/home             01047   17170816
    02096 /dev/vg0/var              00000   17179008
    02097 /dev/vg0/var              00001   17187200
    [cut ... ]
    03142 /dev/vg0/var              01046   25747840
    03143 /dev/vg0/var              01047   25756032
    03144 /dev/vg0/mysql            00000   25764224
    03145 /dev/vg0/mysql            00001   25772416
    [ cut ... ]
    07238 /dev/vg0/mysql            04094   59302272
    07239 /dev/vg0/mysql            04095   59310464
    07240 free
    .....
    08589 free


And this is the output for lvdisplay -v /dev/vg00/root:

--- Logical volume ---
LV Name                /dev/vg0/root
VG Name                vg0
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                4.09 GB
Current LE             1048
Allocated LE           1048
Allocation             next free
Read ahead sectors     1024
Block device           58:0

    --- Distribution of logical volume on 1 physical volume  ---
    PV Name                  PE on PV     reads      writes
    /dev/md2                 1048         1405215    2647120

    --- logical volume i/o statistic ---
    1405215 reads  2647120 writes

    --- Logical extents ---
    LE    PV                        PE     reads      writes
    00000 /dev/md2                  00000  16         26546
    00001 /dev/md2                  00001  4          52466
    00002 /dev/md2                  00002  2          52173
    00003 /dev/md2                  00003  2          52173
    00004 /dev/md2                  00004  2          52173
    00005 /dev/md2                  00005  2          52173
    00006 /dev/md2                  00006  2          52173
    00007 /dev/md2                  00007  2          52173
    00008 /dev/md2                  00008  123        27181
    00009 /dev/md2                  00009  0          4762
    00010 /dev/md2                  00010  0          10442
    00011 /dev/md2                  00011  0          9266
    00012 /dev/md2                  00012  0          3113
    00013 /dev/md2                  00013  0          9510
    00014 /dev/md2                  00014  80         7140
    00015 /dev/md2                  00015  0          4017
    00016 /dev/md2                  00016  0          2143
    00017 /dev/md2                  00017  0          8201
    00018 /dev/md2                  00018  0          8106
    00019 /dev/md2                  00019  0          9883
    00020 /dev/md2                  00020  0          11927
    00021 /dev/md2                  00021  0          10819
    00022 /dev/md2                  00022  0          9261
    00023 /dev/md2                  00023  0          8151
    00024 /dev/md2                  00024  74         4797
    00025 /dev/md2                  00025  2674       4875
    00026 /dev/md2                  00026  1101       5714
    00027 /dev/md2                  00027  1047       6983
    00028 /dev/md2                  00028  1043       7494
    00029 /dev/md2                  00029  1039       7684
    00030 /dev/md2                  00030  1023       7960
    00031 /dev/md2                  00031  1453       8006
    00032 /dev/md2                  00032  421        579
    00033 /dev/md2                  00033  158        0
    00034 /dev/md2                  00034  514        0
    00035 /dev/md2                  00035  87         18
    00036 /dev/md2                  00036  1005       52
    00037 /dev/md2                  00037  897        0
    00038 /dev/md2                  00038  1025       0
    00039 /dev/md2                  00039  597        1434
    00040 /dev/md2                  00040  617        4096
    00041 /dev/md2                  00041  446        4096
    00042 /dev/md2                  00042  936        4706
    00043 /dev/md2                  00043  1928       4442
    00044 /dev/md2                  00044  2877       4652
    00045 /dev/md2                  00045  1167       5516
    00046 /dev/md2                  00046  1023       5971
    00047 /dev/md2                  00047  1023       5341
    00048 /dev/md2                  00048  1023       4387
    00049 /dev/md2                  00049  1023       4261
    00050 /dev/md2                  00050  3023       4677
    00051 /dev/md2                  00051  1397       5126
    00052 /dev/md2                  00052  1023       4849
    00053 /dev/md2                  00053  1763       4098
    00054 /dev/md2                  00054  1262       4094
    00055 /dev/md2                  00055  2112       4756
    00056 /dev/md2                  00056  1023       5120
    00057 /dev/md2                  00057  1023       5124
    00058 /dev/md2                  00058  1023       4173
    00059 /dev/md2                  00059  1023       4096
    00060 /dev/md2                  00060  1625       4100
    00061 /dev/md2                  00061  1190       4094
    00062 /dev/md2                  00062  1063       4100
    00063 /dev/md2                  00063  1039       4096
    00064 /dev/md2                  00064  847        1700
    00065 /dev/md2                  00065  165        16
    00066 /dev/md2                  00066  400        0
    00067 /dev/md2                  00067  11         4
    00068 /dev/md2                  00068  972        79
    00069 /dev/md2                  00069  903        732
    00070 /dev/md2                  00070  617        4313
    00071 /dev/md2                  00071  834        3648
    00072 /dev/md2                  00072  1389       5747
    00073 /dev/md2                  00073  1023       4369
    00074 /dev/md2                  00074  1023       4096
    00075 /dev/md2                  00075  1023       4098
    00076 /dev/md2                  00076  1023       4098
    00077 /dev/md2                  00077  1023       4094
    00078 /dev/md2                  00078  1443       4094
    00079 /dev/md2                  00079  1023       4100
    00080 /dev/md2                  00080  1023       4100
    00081 /dev/md2                  00081  1842       4096
    00082 /dev/md2                  00082  1183       4100
    00083 /dev/md2                  00083  1134       4096
    00084 /dev/md2                  00084  1823       4094
    00085 /dev/md2                  00085  2027       4094
    00086 /dev/md2                  00086  1023       4104
    00087 /dev/md2                  00087  1459       4098
    00088 /dev/md2                  00088  1023       4100
    00089 /dev/md2                  00089  1023       4094
    00090 /dev/md2                  00090  1023       4094
    00091 /dev/md2                  00091  1023       4096
    00092 /dev/md2                  00092  1023       4130
    00093 /dev/md2                  00093  1023       4096
    00094 /dev/md2                  00094  1507       4120
    00095 /dev/md2                  00095  1023       4099
    00096 /dev/md2                  00096  212        297
    00097 /dev/md2                  00097  42         0
    00098 /dev/md2                  00098  102        0
    00099 /dev/md2                  00099  86         16
    00100 /dev/md2                  00100  944        56
    00101 /dev/md2                  00101  1608       606
    00102 /dev/md2                  00102  2044       1024
    00103 /dev/md2                  00103  1989       1024
    00104 /dev/md2                  00104  1745       3554
    00105 /dev/md2                  00105  2043       4094
    00106 /dev/md2                  00106  2019       4098
    00107 /dev/md2                  00107  2014       4098
    00108 /dev/md2                  00108  2039       4100
    00109 /dev/md2                  00109  2006       4096
    00110 /dev/md2                  00110  2009       4100
    00111 /dev/md2                  00111  2045       4096
    00112 /dev/md2                  00112  2046       4096
    00113 /dev/md2                  00113  2046       4098
    00114 /dev/md2                  00114  2046       4098
    00115 /dev/md2                  00115  2046       4098
    00116 /dev/md2                  00116  1971       4094
    00117 /dev/md2                  00117  2078       4094
    00118 /dev/md2                  00118  3969       4098
    00119 /dev/md2                  00119  1023       4098
    00120 /dev/md2                  00120  1075       4094
    00121 /dev/md2                  00121  1365       4100
    00122 /dev/md2                  00122  1023       4137
    00123 /dev/md2                  00123  1023       5120
    00124 /dev/md2                  00124  1025       5118
    00125 /dev/md2                  00125  1023       5122
    00126 /dev/md2                  00126  1023       5122
    00127 /dev/md2                  00127  1558       5122
    00128 /dev/md2                  00128  298        77
    00129 /dev/md2                  00129  538        2397
    00130 /dev/md2                  00130  1023       5118
    00131 /dev/md2                  00131  1055       5118
    00132 /dev/md2                  00132  1023       5118
    00133 /dev/md2                  00133  1024       5122
    00134 /dev/md2                  00134  1023       5124
    00135 /dev/md2                  00135  1023       5120
    00136 /dev/md2                  00136  1023       5124
    00137 /dev/md2                  00137  1023       5118
    00138 /dev/md2                  00138  1023       5138
    00139 /dev/md2                  00139  1105       5134
    00140 /dev/md2                  00140  1461       5126
    00141 /dev/md2                  00141  1023       5122
    00142 /dev/md2                  00142  1023       5120
    00143 /dev/md2                  00143  1023       4880
    00144 /dev/md2                  00144  1023       4098
    00145 /dev/md2                  00145  1023       4096
    00146 /dev/md2                  00146  1849       4100
    00147 /dev/md2                  00147  1592       4096
    00148 /dev/md2                  00148  1023       4101
    00149 /dev/md2                  00149  1023       4099
    00150 /dev/md2                  00150  1023       4096
    00151 /dev/md2                  00151  1023       4098
    00152 /dev/md2                  00152  1023       4098
    00153 /dev/md2                  00153  1023       4098
    00154 /dev/md2                  00154  1023       4096
    00155 /dev/md2                  00155  1023       4096
    00156 /dev/md2                  00156  1306       4096
    00157 /dev/md2                  00157  1023       4096
    00158 /dev/md2                  00158  1023       4090
    00159 /dev/md2                  00159  1023       4087
    00160 /dev/md2                  00160  220        868
    00161 /dev/md2                  00161  1023       4167
    00162 /dev/md2                  00162  1023       4380
    00163 /dev/md2                  00163  1023       4082
    00164 /dev/md2                  00164  2255       4087
    00165 /dev/md2                  00165  1568       4089
    00166 /dev/md2                  00166  1023       4082
    00167 /dev/md2                  00167  1518       4079
    00168 /dev/md2                  00168  1023       4086
    00169 /dev/md2                  00169  1023       4089
    00170 /dev/md2                  00170  1023       4077
    00171 /dev/md2                  00171  1023       4089
    00172 /dev/md2                  00172  1023       3574
    00173 /dev/md2                  00173  1064       3072
    00174 /dev/md2                  00174  1023       3070
    00175 /dev/md2                  00175  1026       3074
    00176 /dev/md2                  00176  1023       3072
    00177 /dev/md2                  00177  1023       3072
    00178 /dev/md2                  00178  1023       3080
    00179 /dev/md2                  00179  1023       3078
    00180 /dev/md2                  00180  1023       3074
    00181 /dev/md2                  00181  1023       3072
    00182 /dev/md2                  00182  1023       3070
    00183 /dev/md2                  00183  1023       3072
    00184 /dev/md2                  00184  1023       3072
    00185 /dev/md2                  00185  1023       3072
    00186 /dev/md2                  00186  1023       3076
    00187 /dev/md2                  00187  1023       3070
    00188 /dev/md2                  00188  1023       3070
    00189 /dev/md2                  00189  1023       3072
    00190 /dev/md2                  00190  1035       3070
    00191 /dev/md2                  00191  1023       3070
    00192 /dev/md2                  00192  241        1969
    00193 /dev/md2                  00193  374        0
    00194 /dev/md2                  00194  495        0
    00195 /dev/md2                  00195  153        0
    00196 /dev/md2                  00196  1          0
    00197 /dev/md2                  00197  169        0
    00198 /dev/md2                  00198  792        5260
    00199 /dev/md2                  00199  1105       3517
    00200 /dev/md2                  00200  834        3959
    00201 /dev/md2                  00201  1511       5543
    00202 /dev/md2                  00202  1446       4355
    00203 /dev/md2                  00203  1116       4147
    00204 /dev/md2                  00204  1023       3535
    00205 /dev/md2                  00205  1023       3074
    00206 /dev/md2                  00206  1023       3072
    00207 /dev/md2                  00207  1023       3072
    00208 /dev/md2                  00208  1023       3076
    00209 /dev/md2                  00209  544        1631
    00210 /dev/md2                  00210  0          0
    00211 /dev/md2                  00211  0          0
    00212 /dev/md2                  00212  0          0
    00213 /dev/md2                  00213  0          0
    00214 /dev/md2                  00214  0          0
    00215 /dev/md2                  00215  0          0
    00216 /dev/md2                  00216  0          0
    00217 /dev/md2                  00217  0          0
    00218 /dev/md2                  00218  0          0
    00219 /dev/md2                  00219  0          0
    00220 /dev/md2                  00220  0          0
    00221 /dev/md2                  00221  0          0
    00222 /dev/md2                  00222  0          0
    00223 /dev/md2                  00223  0          0
    00224 /dev/md2                  00224  163        1050
    00225 /dev/md2                  00225  233        11
    00226 /dev/md2                  00226  424        0
    00227 /dev/md2                  00227  60         0
    00228 /dev/md2                  00228  676        2
    00229 /dev/md2                  00229  876        232
    00230 /dev/md2                  00230  61         3061
    00231 /dev/md2                  00231  0          1579
    00232 /dev/md2                  00232  0          0
    00233 /dev/md2                  00233  0          0
    00234 /dev/md2                  00234  0          0
    00235 /dev/md2                  00235  0          0
    00236 /dev/md2                  00236  0          0
    00237 /dev/md2                  00237  0          0
    00238 /dev/md2                  00238  0          0
    00239 /dev/md2                  00239  0          0
    00240 /dev/md2                  00240  0          0
    00241 /dev/md2                  00241  0          0
    00242 /dev/md2                  00242  0          0
    00243 /dev/md2                  00243  0          0
    00244 /dev/md2                  00244  0          0
    00245 /dev/md2                  00245  0          0
    00246 /dev/md2                  00246  0          0
    00247 /dev/md2                  00247  0          0
    00248 /dev/md2                  00248  0          0
    00249 /dev/md2                  00249  0          0
    00250 /dev/md2                  00250  0          0
    00251 /dev/md2                  00251  0          0
    00252 /dev/md2                  00252  0          0
    00253 /dev/md2                  00253  0          0
    00254 /dev/md2                  00254  0          0
    00255 /dev/md2                  00255  0          0
    00256 /dev/md2                  00256  334        1092
    00257 /dev/md2                  00257  604        0
    00258 /dev/md2                  00258  935        0
    00259 /dev/md2                  00259  139        0
    00260 /dev/md2                  00260  2          0
    00261 /dev/md2                  00261  415        1772
    00262 /dev/md2                  00262  38         3713
    00263 /dev/md2                  00263  0          2461
    00264 /dev/md2                  00264  0          88
    00265 /dev/md2                  00265  0          0
    00266 /dev/md2                  00266  0          0
    00267 /dev/md2                  00267  0          0
    00268 /dev/md2                  00268  0          0
    00269 /dev/md2                  00269  0          0
    00270 /dev/md2                  00270  0          0
    00271 /dev/md2                  00271  0          0
    00272 /dev/md2                  00272  0          0
    00273 /dev/md2                  00273  0          0
    00274 /dev/md2                  00274  0          0
    00275 /dev/md2                  00275  0          0
    00276 /dev/md2                  00276  0          0
    00277 /dev/md2                  00277  0          0
    00278 /dev/md2                  00278  0          0
    00279 /dev/md2                  00279  0          0
    00280 /dev/md2                  00280  0          0
    00281 /dev/md2                  00281  0          0
    00282 /dev/md2                  00282  0          0
    00283 /dev/md2                  00283  0          0
    00284 /dev/md2                  00284  0          0
    00285 /dev/md2                  00285  0          0
    00286 /dev/md2                  00286  0          0
    00287 /dev/md2                  00287  0          0
    00288 /dev/md2                  00288  149        710
    00289 /dev/md2                  00289  86         0
    00290 /dev/md2                  00290  395        0
    00291 /dev/md2                  00291  12         0
    00292 /dev/md2                  00292  798        60
    00293 /dev/md2                  00293  642        1267
    00294 /dev/md2                  00294  1          2694
    00295 /dev/md2                  00295  0          1275
    00296 /dev/md2                  00296  0          0
    00297 /dev/md2                  00297  0          0
    00298 /dev/md2                  00298  0          0
    00299 /dev/md2                  00299  0          0
    00300 /dev/md2                  00300  0          0
    00301 /dev/md2                  00301  0          0
    00302 /dev/md2                  00302  0          0
    00303 /dev/md2                  00303  0          0
    00304 /dev/md2                  00304  0          0
    00305 /dev/md2                  00305  0          0
    00306 /dev/md2                  00306  0          0
    00307 /dev/md2                  00307  0          0
    00308 /dev/md2                  00308  0          0
    00309 /dev/md2                  00309  0          0
    00310 /dev/md2                  00310  0          0
    00311 /dev/md2                  00311  0          0
    00312 /dev/md2                  00312  0          0
    00313 /dev/md2                  00313  0          0
    00314 /dev/md2                  00314  0          0
    00315 /dev/md2                  00315  0          0
    00316 /dev/md2                  00316  0          0
    00317 /dev/md2                  00317  0          0
    00318 /dev/md2                  00318  0          0
    00319 /dev/md2                  00319  0          0
    00320 /dev/md2                  00320  119        959
    00321 /dev/md2                  00321  77         0
    00322 /dev/md2                  00322  960        0
    00323 /dev/md2                  00323  32         4
    00324 /dev/md2                  00324  969        65
    00325 /dev/md2                  00325  730        1603
    00326 /dev/md2                  00326  237        3207
    00327 /dev/md2                  00327  347        3565
    00328 /dev/md2                  00328  0          1631
    00329 /dev/md2                  00329  0          1024
    00330 /dev/md2                  00330  0          1024
    00331 /dev/md2                  00331  188        1341
    00332 /dev/md2                  00332  0          1021
    00333 /dev/md2                  00333  0          25
    00334 /dev/md2                  00334  0          0
    00335 /dev/md2                  00335  0          0
    00336 /dev/md2                  00336  0          0
    00337 /dev/md2                  00337  0          0
    00338 /dev/md2                  00338  0          0
    00339 /dev/md2                  00339  0          0
    00340 /dev/md2                  00340  0          0
    00341 /dev/md2                  00341  0          0
    00342 /dev/md2                  00342  0          0
    00343 /dev/md2                  00343  0          0
    00344 /dev/md2                  00344  0          0
    00345 /dev/md2                  00345  0          0
    00346 /dev/md2                  00346  0          0
    00347 /dev/md2                  00347  0          0
    00348 /dev/md2                  00348  0          0
    00349 /dev/md2                  00349  0          0
    00350 /dev/md2                  00350  0          0
    00351 /dev/md2                  00351  0          0
    00352 /dev/md2                  00352  137        983
    00353 /dev/md2                  00353  0          0
    00354 /dev/md2                  00354  25         5
    00355 /dev/md2                  00355  74         0
    00356 /dev/md2                  00356  833        39
    00357 /dev/md2                  00357  1024       0
    00358 /dev/md2                  00358  739        286
    00359 /dev/md2                  00359  22         2074
    00360 /dev/md2                  00360  241        2922
    00361 /dev/md2                  00361  21         352
    00362 /dev/md2                  00362  0          0
    00363 /dev/md2                  00363  0          0
    00364 /dev/md2                  00364  0          0
    00365 /dev/md2                  00365  0          0
    00366 /dev/md2                  00366  0          0
    00367 /dev/md2                  00367  0          0
    00368 /dev/md2                  00368  0          0
    00369 /dev/md2                  00369  0          0
    00370 /dev/md2                  00370  0          0
    00371 /dev/md2                  00371  0          0
    00372 /dev/md2                  00372  0          0
    00373 /dev/md2                  00373  0          0
    00374 /dev/md2                  00374  0          0
    00375 /dev/md2                  00375  0          0
    00376 /dev/md2                  00376  0          0
    00377 /dev/md2                  00377  0          0
    00378 /dev/md2                  00378  0          0
    00379 /dev/md2                  00379  0          0
    00380 /dev/md2                  00380  0          0
    00381 /dev/md2                  00381  0          0
    00382 /dev/md2                  00382  0          0
    00383 /dev/md2                  00383  0          0
    00384 /dev/md2                  00384  138        814
    00385 /dev/md2                  00385  50         0
    00386 /dev/md2                  00386  277        0
    00387 /dev/md2                  00387  369        0
    00388 /dev/md2                  00388  1018       2
    00389 /dev/md2                  00389  647        1
    00390 /dev/md2                  00390  0          0
    00391 /dev/md2                  00391  0          0
    00392 /dev/md2                  00392  0          0
    00393 /dev/md2                  00393  0          0
    00394 /dev/md2                  00394  196        1559
    00395 /dev/md2                  00395  201        2133
    00396 /dev/md2                  00396  0          446
    00397 /dev/md2                  00397  0          0
    00398 /dev/md2                  00398  0          0
    00399 /dev/md2                  00399  0          0
    00400 /dev/md2                  00400  0          0
    00401 /dev/md2                  00401  0          0
    00402 /dev/md2                  00402  0          0
    00403 /dev/md2                  00403  0          0
    00404 /dev/md2                  00404  0          0
    00405 /dev/md2                  00405  0          0
    00406 /dev/md2                  00406  0          0
    00407 /dev/md2                  00407  0          0
    00408 /dev/md2                  00408  0          0
    00409 /dev/md2                  00409  0          0
    00410 /dev/md2                  00410  0          0
    00411 /dev/md2                  00411  0          0
    00412 /dev/md2                  00412  0          0
    00413 /dev/md2                  00413  0          0
    00414 /dev/md2                  00414  0          0
    00415 /dev/md2                  00415  0          0
    00416 /dev/md2                  00416  284        4415
    00417 /dev/md2                  00417  566        70
    00418 /dev/md2                  00418  221        4050
    00419 /dev/md2                  00419  0          0
    00420 /dev/md2                  00420  1          0
    00421 /dev/md2                  00421  12         8458
    00422 /dev/md2                  00422  188        4760
    00423 /dev/md2                  00423  297        7840
    00424 /dev/md2                  00424  250        13838
    00425 /dev/md2                  00425  376        4103
    00426 /dev/md2                  00426  494        4797
    00427 /dev/md2                  00427  408        5309
    00428 /dev/md2                  00428  284        2278
    00429 /dev/md2                  00429  300        1940
    00430 /dev/md2                  00430  171        1343
    00431 /dev/md2                  00431  42         1226
    00432 /dev/md2                  00432  4          1041
    00433 /dev/md2                  00433  6          1062
    00434 /dev/md2                  00434  210        1155
    00435 /dev/md2                  00435  710        1153
    00436 /dev/md2                  00436  746        1397
    00437 /dev/md2                  00437  784        1163
    00438 /dev/md2                  00438  615        1108
    00439 /dev/md2                  00439  433        1110
    00440 /dev/md2                  00440  561        1137
    00441 /dev/md2                  00441  654        1201
    00442 /dev/md2                  00442  738        1271
    00443 /dev/md2                  00443  468        1346
    00444 /dev/md2                  00444  1          1024
    00445 /dev/md2                  00445  65         1097
    00446 /dev/md2                  00446  517        1399
    00447 /dev/md2                  00447  424        1768
    00448 /dev/md2                  00448  101        1270
    00449 /dev/md2                  00449  256        49
    00450 /dev/md2                  00450  405        75
    00451 /dev/md2                  00451  72         104
    00452 /dev/md2                  00452  650        59
    00453 /dev/md2                  00453  958        435
    00454 /dev/md2                  00454  29         3683
    00455 /dev/md2                  00455  305        4022
    00456 /dev/md2                  00456  454        3385
    00457 /dev/md2                  00457  687        1208
    00458 /dev/md2                  00458  628        995
    00459 /dev/md2                  00459  914        1009
    00460 /dev/md2                  00460  640        1005
    00461 /dev/md2                  00461  140        223
    00462 /dev/md2                  00462  0          0
    00463 /dev/md2                  00463  0          0
    00464 /dev/md2                  00464  0          0
    00465 /dev/md2                  00465  0          0
    00466 /dev/md2                  00466  0          0
    00467 /dev/md2                  00467  0          0
    00468 /dev/md2                  00468  0          0
    00469 /dev/md2                  00469  0          0
    00470 /dev/md2                  00470  0          0
    00471 /dev/md2                  00471  0          0
    00472 /dev/md2                  00472  0          0
    00473 /dev/md2                  00473  0          0
    00474 /dev/md2                  00474  0          0
    00475 /dev/md2                  00475  0          0
    00476 /dev/md2                  00476  0          0
    00477 /dev/md2                  00477  0          0
    00478 /dev/md2                  00478  0          0
    00479 /dev/md2                  00479  0          0
    00480 /dev/md2                  00480  167        1020
    00481 /dev/md2                  00481  227        0
    00482 /dev/md2                  00482  635        4
    00483 /dev/md2                  00483  74         0
    00484 /dev/md2                  00484  944        62
    00485 /dev/md2                  00485  638        1275
    00486 /dev/md2                  00486  0          3866
    00487 /dev/md2                  00487  307        3632
    00488 /dev/md2                  00488  0          4364
    00489 /dev/md2                  00489  0          1288
    00490 /dev/md2                  00490  0          479
    00491 /dev/md2                  00491  0          0
    00492 /dev/md2                  00492  0          0
    00493 /dev/md2                  00493  0          0
    00494 /dev/md2                  00494  0          0
    00495 /dev/md2                  00495  0          1116
    00496 /dev/md2                  00496  0          1005
    00497 /dev/md2                  00497  0          450
    00498 /dev/md2                  00498  0          317
    00499 /dev/md2                  00499  0          638
    00500 /dev/md2                  00500  0          1019
    00501 /dev/md2                  00501  0          723
    00502 /dev/md2                  00502  0          988
    00503 /dev/md2                  00503  0          3986
    00504 /dev/md2                  00504  0          2330
    00505 /dev/md2                  00505  0          161
    00506 /dev/md2                  00506  0          595
    00507 /dev/md2                  00507  0          799
    00508 /dev/md2                  00508  0          0
    00509 /dev/md2                  00509  0          0
    00510 /dev/md2                  00510  0          0
    00511 /dev/md2                  00511  0          0
    00512 /dev/md2                  00512  129        1268
    00513 /dev/md2                  00513  25         0
    00514 /dev/md2                  00514  394        34
    00515 /dev/md2                  00515  22         0
    00516 /dev/md2                  00516  175        5
    00517 /dev/md2                  00517  651        1353
    00518 /dev/md2                  00518  73         3250
    00519 /dev/md2                  00519  108        1740
    00520 /dev/md2                  00520  251        2706
    00521 /dev/md2                  00521  0          673
    00522 /dev/md2                  00522  0          0
    00523 /dev/md2                  00523  0          0
    00524 /dev/md2                  00524  0          0
    00525 /dev/md2                  00525  0          0
    00526 /dev/md2                  00526  0          0
    00527 /dev/md2                  00527  0          0
    00528 /dev/md2                  00528  0          0
    00529 /dev/md2                  00529  0          0
    00530 /dev/md2                  00530  0          0
    00531 /dev/md2                  00531  0          0
    00532 /dev/md2                  00532  0          0
    00533 /dev/md2                  00533  0          0
    00534 /dev/md2                  00534  0          0
    00535 /dev/md2                  00535  0          0
    00536 /dev/md2                  00536  0          0
    00537 /dev/md2                  00537  0          0
    00538 /dev/md2                  00538  0          0
    00539 /dev/md2                  00539  0          0
    00540 /dev/md2                  00540  0          0
    00541 /dev/md2                  00541  0          0
    00542 /dev/md2                  00542  0          0
    00543 /dev/md2                  00543  0          0
    00544 /dev/md2                  00544  145        159
    00545 /dev/md2                  00545  0          1833
    00546 /dev/md2                  00546  0          948
    00547 /dev/md2                  00547  0          0
    00548 /dev/md2                  00548  0          0
    00549 /dev/md2                  00549  0          0
    00550 /dev/md2                  00550  0          0
    00551 /dev/md2                  00551  0          0
    00552 /dev/md2                  00552  0          0
    00553 /dev/md2                  00553  0          0
    00554 /dev/md2                  00554  0          0
    00555 /dev/md2                  00555  0          0
    00556 /dev/md2                  00556  0          0
    00557 /dev/md2                  00557  0          0
    00558 /dev/md2                  00558  0          0
    00559 /dev/md2                  00559  0          0
    00560 /dev/md2                  00560  0          0
    00561 /dev/md2                  00561  0          0
    00562 /dev/md2                  00562  0          0
    00563 /dev/md2                  00563  0          0
    00564 /dev/md2                  00564  0          0
    00565 /dev/md2                  00565  0          0
    00566 /dev/md2                  00566  0          0
    00567 /dev/md2                  00567  0          0
    00568 /dev/md2                  00568  0          0
    00569 /dev/md2                  00569  0          0
    00570 /dev/md2                  00570  0          0
    00571 /dev/md2                  00571  0          0
    00572 /dev/md2                  00572  0          0
    00573 /dev/md2                  00573  0          0
    00574 /dev/md2                  00574  0          0
    00575 /dev/md2                  00575  0          0
    00576 /dev/md2                  00576  157        412
    00577 /dev/md2                  00577  77         1
    00578 /dev/md2                  00578  10         0
    00579 /dev/md2                  00579  20         0
    00580 /dev/md2                  00580  887        38
    00581 /dev/md2                  00581  987        463
    00582 /dev/md2                  00582  1407       6701
    00583 /dev/md2                  00583  1977       5266
    00584 /dev/md2                  00584  3121       4728
    00585 /dev/md2                  00585  3141       4096
    00586 /dev/md2                  00586  3129       4096
    00587 /dev/md2                  00587  3141       4096
    00588 /dev/md2                  00588  3141       4100
    00589 /dev/md2                  00589  3147       4100
    00590 /dev/md2                  00590  3125       4098
    00591 /dev/md2                  00591  3125       4096
    00592 /dev/md2                  00592  3125       4100
    00593 /dev/md2                  00593  3121       4100
    00594 /dev/md2                  00594  3105       3150
    00595 /dev/md2                  00595  3131       3072
    00596 /dev/md2                  00596  3125       3072
    00597 /dev/md2                  00597  3117       3074
    00598 /dev/md2                  00598  3125       3070
    00599 /dev/md2                  00599  3121       3074
    00600 /dev/md2                  00600  3153       3072
    00601 /dev/md2                  00601  3137       3072
    00602 /dev/md2                  00602  3125       3076
    00603 /dev/md2                  00603  3135       3074
    00604 /dev/md2                  00604  3125       3074
    00605 /dev/md2                  00605  3171       3074
    00606 /dev/md2                  00606  3141       3076
    00607 /dev/md2                  00607  3105       3074
    00608 /dev/md2                  00608  162        1071
    00609 /dev/md2                  00609  131        0
    00610 /dev/md2                  00610  421        0
    00611 /dev/md2                  00611  44         0
    00612 /dev/md2                  00612  241        14
    00613 /dev/md2                  00613  939        1574
    00614 /dev/md2                  00614  2089       5413
    00615 /dev/md2                  00615  753        4027
    00616 /dev/md2                  00616  3171       4393
    00617 /dev/md2                  00617  3157       3076
    00618 /dev/md2                  00618  3141       3072
    00619 /dev/md2                  00619  3138       3072
    00620 /dev/md2                  00620  3132       3070
    00621 /dev/md2                  00621  3129       3074
    00622 /dev/md2                  00622  3149       3074
    00623 /dev/md2                  00623  3105       3072
    00624 /dev/md2                  00624  3125       3072
    00625 /dev/md2                  00625  3141       3074
    00626 /dev/md2                  00626  3145       3072
    00627 /dev/md2                  00627  3117       3074
    00628 /dev/md2                  00628  3129       3074
    00629 /dev/md2                  00629  3133       3072
    00630 /dev/md2                  00630  3167       3078
    00631 /dev/md2                  00631  3161       3078
    00632 /dev/md2                  00632  3141       3076
    00633 /dev/md2                  00633  3129       3076
    00634 /dev/md2                  00634  3117       3076
    00635 /dev/md2                  00635  3143       3074
    00636 /dev/md2                  00636  3121       3072
    00637 /dev/md2                  00637  3153       3074
    00638 /dev/md2                  00638  3133       3074
    00639 /dev/md2                  00639  3125       3076
    00640 /dev/md2                  00640  83         915
    00641 /dev/md2                  00641  157        0
    00642 /dev/md2                  00642  47         0
    00643 /dev/md2                  00643  61         0
    00644 /dev/md2                  00644  81         0
    00645 /dev/md2                  00645  391        0
    00646 /dev/md2                  00646  40         0
    00647 /dev/md2                  00647  20         0
    00648 /dev/md2                  00648  0          0
    00649 /dev/md2                  00649  71         0
    00650 /dev/md2                  00650  1947       3673
    00651 /dev/md2                  00651  3225       5271
    00652 /dev/md2                  00652  3123       5161
    00653 /dev/md2                  00653  3133       3076
    00654 /dev/md2                  00654  3109       3070
    00655 /dev/md2                  00655  3125       3070
    00656 /dev/md2                  00656  3121       3070
    00657 /dev/md2                  00657  3147       3080
    00658 /dev/md2                  00658  3121       3074
    00659 /dev/md2                  00659  3141       3078
    00660 /dev/md2                  00660  3117       3076
    00661 /dev/md2                  00661  3149       3078
    00662 /dev/md2                  00662  3133       3072
    00663 /dev/md2                  00663  3111       3078
    00664 /dev/md2                  00664  3121       3074
    00665 /dev/md2                  00665  3137       3072
    00666 /dev/md2                  00666  3143       3074
    00667 /dev/md2                  00667  3129       3074
    00668 /dev/md2                  00668  3121       3074
    00669 /dev/md2                  00669  3133       3074
    00670 /dev/md2                  00670  3113       3070
    00671 /dev/md2                  00671  3125       3074
    00672 /dev/md2                  00672  112        294
    00673 /dev/md2                  00673  164        0
    00674 /dev/md2                  00674  70         0
    00675 /dev/md2                  00675  118        18
    00676 /dev/md2                  00676  15         0
    00677 /dev/md2                  00677  2          0
    00678 /dev/md2                  00678  37         21
    00679 /dev/md2                  00679  18         18
    00680 /dev/md2                  00680  356        0
    00681 /dev/md2                  00681  29         27
    00682 /dev/md2                  00682  27         27
    00683 /dev/md2                  00683  57         0
    00684 /dev/md2                  00684  0          0
    00685 /dev/md2                  00685  156        18
    00686 /dev/md2                  00686  649        0
    00687 /dev/md2                  00687  36         36
    00688 /dev/md2                  00688  0          0
    00689 /dev/md2                  00689  0          0
    00690 /dev/md2                  00690  0          0
    00691 /dev/md2                  00691  0          0
    00692 /dev/md2                  00692  22         21
    00693 /dev/md2                  00693  0          0
    00694 /dev/md2                  00694  260        36
    00695 /dev/md2                  00695  3109       3044
    00696 /dev/md2                  00696  3105       3072
    00697 /dev/md2                  00697  3139       3074
    00698 /dev/md2                  00698  3125       3080
    00699 /dev/md2                  00699  3125       3072
    00700 /dev/md2                  00700  3141       3074
    00701 /dev/md2                  00701  3153       3078
    00702 /dev/md2                  00702  3145       3072
    00703 /dev/md2                  00703  3117       3074
    00704 /dev/md2                  00704  255        1706
    00705 /dev/md2                  00705  157        0
    00706 /dev/md2                  00706  388        17
    00707 /dev/md2                  00707  51         8
    00708 /dev/md2                  00708  901        35
    00709 /dev/md2                  00709  1020       1525
    00710 /dev/md2                  00710  1597       4679
    00711 /dev/md2                  00711  1406       2791
    00712 /dev/md2                  00712  3251       6783
    00713 /dev/md2                  00713  3146       3126
    00714 /dev/md2                  00714  3135       3072
    00715 /dev/md2                  00715  3129       3070
    00716 /dev/md2                  00716  3144       3596
    00717 /dev/md2                  00717  3120       3717
    00718 /dev/md2                  00718  3141       3203
    00719 /dev/md2                  00719  3109       4079
    00720 /dev/md2                  00720  3123       4094
    00721 /dev/md2                  00721  3116       3404
    00722 /dev/md2                  00722  3101       3933
    00723 /dev/md2                  00723  3135       5123
    00724 /dev/md2                  00724  3146       4324
    00725 /dev/md2                  00725  3129       4218
    00726 /dev/md2                  00726  3111       3178
    00727 /dev/md2                  00727  3136       3970
    00728 /dev/md2                  00728  3111       3072
    00729 /dev/md2                  00729  3109       3074
    00730 /dev/md2                  00730  3141       3070
    00731 /dev/md2                  00731  3117       3076
    00732 /dev/md2                  00732  3137       3072
    00733 /dev/md2                  00733  3127       3078
    00734 /dev/md2                  00734  3133       3076
    00735 /dev/md2                  00735  3137       3074
    00736 /dev/md2                  00736  131        1237
    00737 /dev/md2                  00737  187        20
    00738 /dev/md2                  00738  230        0
    00739 /dev/md2                  00739  65         0
    00740 /dev/md2                  00740  910        82
    00741 /dev/md2                  00741  1041       1583
    00742 /dev/md2                  00742  2173       5459
    00743 /dev/md2                  00743  502        3371
    00744 /dev/md2                  00744  3282       5326
    00745 /dev/md2                  00745  3236       4891
    00746 /dev/md2                  00746  3119       4104
    00747 /dev/md2                  00747  3117       3070
    00748 /dev/md2                  00748  3109       3479
    00749 /dev/md2                  00749  3137       3893
    00750 /dev/md2                  00750  3163       5477
    00751 /dev/md2                  00751  3129       4693
    00752 /dev/md2                  00752  3141       4033
    00753 /dev/md2                  00753  3117       3505
    00754 /dev/md2                  00754  3109       3072
    00755 /dev/md2                  00755  3097       4378
    00756 /dev/md2                  00756  3121       5301
    00757 /dev/md2                  00757  3135       3923
    00758 /dev/md2                  00758  3127       3072
    00759 /dev/md2                  00759  3129       3906
    00760 /dev/md2                  00760  3147       3072
    00761 /dev/md2                  00761  3125       3076
    00762 /dev/md2                  00762  3147       3076
    00763 /dev/md2                  00763  3129       3074
    00764 /dev/md2                  00764  3113       3072
    00765 /dev/md2                  00765  3141       3070
    00766 /dev/md2                  00766  3099       3074
    00767 /dev/md2                  00767  3115       3070
    00768 /dev/md2                  00768  60         180
    00769 /dev/md2                  00769  1          0
    00770 /dev/md2                  00770  33         0
    00771 /dev/md2                  00771  758        0
    00772 /dev/md2                  00772  167        0
    00773 /dev/md2                  00773  0          0
    00774 /dev/md2                  00774  0          0
    00775 /dev/md2                  00775  0          0
    00776 /dev/md2                  00776  0          0
    00777 /dev/md2                  00777  0          0
    00778 /dev/md2                  00778  0          0
    00779 /dev/md2                  00779  0          0
    00780 /dev/md2                  00780  1421       678
    00781 /dev/md2                  00781  3131       3072
    00782 /dev/md2                  00782  3123       3070
    00783 /dev/md2                  00783  3137       3074
    00784 /dev/md2                  00784  3133       3074
    00785 /dev/md2                  00785  3125       3072
    00786 /dev/md2                  00786  3097       3074
    00787 /dev/md2                  00787  3133       3078
    00788 /dev/md2                  00788  3129       3074
    00789 /dev/md2                  00789  3147       3074
    00790 /dev/md2                  00790  3129       3076
    00791 /dev/md2                  00791  3129       3072
    00792 /dev/md2                  00792  3145       3070
    00793 /dev/md2                  00793  3135       3070
    00794 /dev/md2                  00794  3139       3072
    00795 /dev/md2                  00795  3141       3072
    00796 /dev/md2                  00796  3125       3070
    00797 /dev/md2                  00797  3125       3074
    00798 /dev/md2                  00798  3137       3076
    00799 /dev/md2                  00799  3117       3070
    00800 /dev/md2                  00800  424        1591
    00801 /dev/md2                  00801  978        0
    00802 /dev/md2                  00802  498        0
    00803 /dev/md2                  00803  278        46
    00804 /dev/md2                  00804  1046       1621
    00805 /dev/md2                  00805  2006       6127
    00806 /dev/md2                  00806  1013       5629
    00807 /dev/md2                  00807  3109       3508
    00808 /dev/md2                  00808  3101       3072
    00809 /dev/md2                  00809  3141       3076
    00810 /dev/md2                  00810  3128       3074
    00811 /dev/md2                  00811  3118       3076
    00812 /dev/md2                  00812  3122       3072
    00813 /dev/md2                  00813  3124       3076
    00814 /dev/md2                  00814  3119       3074
    00815 /dev/md2                  00815  3141       3074
    00816 /dev/md2                  00816  3121       3072
    00817 /dev/md2                  00817  3109       3074
    00818 /dev/md2                  00818  3122       3080
    00819 /dev/md2                  00819  3128       3074
    00820 /dev/md2                  00820  3149       3076
    00821 /dev/md2                  00821  3141       3074
    00822 /dev/md2                  00822  3121       3070
    00823 /dev/md2                  00823  3129       3074
    00824 /dev/md2                  00824  3151       3072
    00825 /dev/md2                  00825  3129       3072
    00826 /dev/md2                  00826  3131       3074
    00827 /dev/md2                  00827  3137       3080
    00828 /dev/md2                  00828  3117       3076
    00829 /dev/md2                  00829  3107       3074
    00830 /dev/md2                  00830  3121       3074
    00831 /dev/md2                  00831  3153       3078
    00832 /dev/md2                  00832  238        82
    00833 /dev/md2                  00833  1946       1615
    00834 /dev/md2                  00834  3143       3072
    00835 /dev/md2                  00835  3129       3072
    00836 /dev/md2                  00836  3141       3070
    00837 /dev/md2                  00837  3165       3076
    00838 /dev/md2                  00838  3125       3070
    00839 /dev/md2                  00839  3137       3074
    00840 /dev/md2                  00840  3139       3072
    00841 /dev/md2                  00841  3133       3072
    00842 /dev/md2                  00842  3125       3074
    00843 /dev/md2                  00843  3131       3076
    00844 /dev/md2                  00844  3167       3074
    00845 /dev/md2                  00845  3109       3074
    00846 /dev/md2                  00846  3121       3070
    00847 /dev/md2                  00847  3119       3074
    00848 /dev/md2                  00848  3133       3072
    00849 /dev/md2                  00849  3117       3076
    00850 /dev/md2                  00850  3157       3074
    00851 /dev/md2                  00851  3151       3078
    00852 /dev/md2                  00852  3147       3082
    00853 /dev/md2                  00853  3129       3072
    00854 /dev/md2                  00854  3133       3074
    00855 /dev/md2                  00855  3105       3072
    00856 /dev/md2                  00856  3141       3074
    00857 /dev/md2                  00857  3127       3072
    00858 /dev/md2                  00858  3152       3072
    00859 /dev/md2                  00859  3112       3072
    00860 /dev/md2                  00860  3101       3070
    00861 /dev/md2                  00861  3141       3076
    00862 /dev/md2                  00862  3147       3072
    00863 /dev/md2                  00863  3165       3076
    00864 /dev/md2                  00864  214        1008
    00865 /dev/md2                  00865  62         0
    00866 /dev/md2                  00866  377        0
    00867 /dev/md2                  00867  128        3
    00868 /dev/md2                  00868  895        48
    00869 /dev/md2                  00869  1855       3015
    00870 /dev/md2                  00870  614        3169
    00871 /dev/md2                  00871  2919       4249
    00872 /dev/md2                  00872  3124       3204
    00873 /dev/md2                  00873  3136       3072
    00874 /dev/md2                  00874  3127       3074
    00875 /dev/md2                  00875  3093       3072
    00876 /dev/md2                  00876  3133       3074
    00877 /dev/md2                  00877  3137       3074
    00878 /dev/md2                  00878  3129       3074
    00879 /dev/md2                  00879  3153       3078
    00880 /dev/md2                  00880  3101       3070
    00881 /dev/md2                  00881  3113       3070
    00882 /dev/md2                  00882  3149       3078
    00883 /dev/md2                  00883  3117       3072
    00884 /dev/md2                  00884  3125       3070
    00885 /dev/md2                  00885  3137       3070
    00886 /dev/md2                  00886  3133       3074
    00887 /dev/md2                  00887  3127       3078
    00888 /dev/md2                  00888  3100       3070
    00889 /dev/md2                  00889  3140       3074
    00890 /dev/md2                  00890  3153       3076
    00891 /dev/md2                  00891  3131       3072
    00892 /dev/md2                  00892  3129       3074
    00893 /dev/md2                  00893  3135       3072
    00894 /dev/md2                  00894  3147       3076
    00895 /dev/md2                  00895  3133       3072
    00896 /dev/md2                  00896  116        113
    00897 /dev/md2                  00897  3037       3414
    00898 /dev/md2                  00898  3141       3074
    00899 /dev/md2                  00899  3113       3074
    00900 /dev/md2                  00900  3141       3072
    00901 /dev/md2                  00901  3127       3070
    00902 /dev/md2                  00902  3133       3076
    00903 /dev/md2                  00903  3145       3074
    00904 /dev/md2                  00904  3139       3072
    00905 /dev/md2                  00905  3121       3072
    00906 /dev/md2                  00906  3113       3072
    00907 /dev/md2                  00907  3137       3074
    00908 /dev/md2                  00908  3117       3070
    00909 /dev/md2                  00909  3123       3076
    00910 /dev/md2                  00910  3129       3070
    00911 /dev/md2                  00911  3145       3072
    00912 /dev/md2                  00912  3125       3070
    00913 /dev/md2                  00913  3137       3070
    00914 /dev/md2                  00914  3133       3070
    00915 /dev/md2                  00915  3133       3074
    00916 /dev/md2                  00916  3139       3070
    00917 /dev/md2                  00917  3129       3070
    00918 /dev/md2                  00918  3125       3070
    00919 /dev/md2                  00919  3141       3078
    00920 /dev/md2                  00920  3101       3072
    00921 /dev/md2                  00921  3101       3070
    00922 /dev/md2                  00922  2924       3072
    00923 /dev/md2                  00923  3129       3074
    00924 /dev/md2                  00924  3101       3074
    00925 /dev/md2                  00925  3137       3078
    00926 /dev/md2                  00926  3133       3072
    00927 /dev/md2                  00927  3117       3076
    00928 /dev/md2                  00928  104        180
    00929 /dev/md2                  00929  506        0
    00930 /dev/md2                  00930  1024       0
    00931 /dev/md2                  00931  1484       666
    00932 /dev/md2                  00932  3101       3072
    00933 /dev/md2                  00933  3127       3076
    00934 /dev/md2                  00934  3152       3074
    00935 /dev/md2                  00935  3132       3072
    00936 /dev/md2                  00936  3151       3080
    00937 /dev/md2                  00937  3125       3074
    00938 /dev/md2                  00938  3141       3072
    00939 /dev/md2                  00939  3139       3072
    00940 /dev/md2                  00940  3139       3070
    00941 /dev/md2                  00941  3165       3074
    00942 /dev/md2                  00942  3117       3074
    00943 /dev/md2                  00943  3125       3074
    00944 /dev/md2                  00944  3137       3070
    00945 /dev/md2                  00945  3137       3072
    00946 /dev/md2                  00946  3129       3070
    00947 /dev/md2                  00947  3117       3072
    00948 /dev/md2                  00948  3117       3070
    00949 /dev/md2                  00949  3127       3074
    00950 /dev/md2                  00950  3125       3070
    00951 /dev/md2                  00951  3121       3072
    00952 /dev/md2                  00952  3109       3074
    00953 /dev/md2                  00953  3133       3072
    00954 /dev/md2                  00954  3165       3078
    00955 /dev/md2                  00955  3141       3072
    00956 /dev/md2                  00956  3157       3074
    00957 /dev/md2                  00957  3163       3076
    00958 /dev/md2                  00958  3117       3072
    00959 /dev/md2                  00959  3169       3074
    00960 /dev/md2                  00960  104        590
    00961 /dev/md2                  00961  29         0
    00962 /dev/md2                  00962  688        0
    00963 /dev/md2                  00963  5          0
    00964 /dev/md2                  00964  1          0
    00965 /dev/md2                  00965  1          0
    00966 /dev/md2                  00966  1          0
    00967 /dev/md2                  00967  909        1197
    00968 /dev/md2                  00968  3376       5258
    00969 /dev/md2                  00969  3125       3695
    00970 /dev/md2                  00970  3129       3072
    00971 /dev/md2                  00971  3169       3078
    00972 /dev/md2                  00972  3113       3074
    00973 /dev/md2                  00973  3117       3076
    00974 /dev/md2                  00974  3121       3072
    00975 /dev/md2                  00975  3133       3072
    00976 /dev/md2                  00976  3165       3072
    00977 /dev/md2                  00977  3149       3074
    00978 /dev/md2                  00978  3101       3074
    00979 /dev/md2                  00979  3109       3072
    00980 /dev/md2                  00980  3125       3072
    00981 /dev/md2                  00981  3133       3076
    00982 /dev/md2                  00982  3137       3076
    00983 /dev/md2                  00983  3143       3070
    00984 /dev/md2                  00984  3137       3074
    00985 /dev/md2                  00985  3105       3072
    00986 /dev/md2                  00986  3109       3072
    00987 /dev/md2                  00987  3125       3076
    00988 /dev/md2                  00988  3117       3076
    00989 /dev/md2                  00989  3117       3074
    00990 /dev/md2                  00990  3115       3074
    00991 /dev/md2                  00991  3147       3074
    00992 /dev/md2                  00992  160        872
    00993 /dev/md2                  00993  91         0
    00994 /dev/md2                  00994  216        0
    00995 /dev/md2                  00995  19         0
    00996 /dev/md2                  00996  940        79
    00997 /dev/md2                  00997  968        63
    00998 /dev/md2                  00998  442        2423
    00999 /dev/md2                  00999  1533       5016
    01000 /dev/md2                  01000  3133       3883
    01001 /dev/md2                  01001  3119       3070
    01002 /dev/md2                  01002  3109       3072
    01003 /dev/md2                  01003  3171       3074
    01004 /dev/md2                  01004  3139       3072
    01005 /dev/md2                  01005  3133       3074
    01006 /dev/md2                  01006  3120       3072
    01007 /dev/md2                  01007  3110       3072
    01008 /dev/md2                  01008  3109       3072
    01009 /dev/md2                  01009  3117       3072
    01010 /dev/md2                  01010  3101       3072
    01011 /dev/md2                  01011  3135       3074
    01012 /dev/md2                  01012  3133       3074
    01013 /dev/md2                  01013  3145       3072
    01014 /dev/md2                  01014  3132       3074
    01015 /dev/md2                  01015  3124       3072
    01016 /dev/md2                  01016  3147       3070
    01017 /dev/md2                  01017  3157       3076
    01018 /dev/md2                  01018  3169       3072
    01019 /dev/md2                  01019  3125       3076
    01020 /dev/md2                  01020  3161       3072
    01021 /dev/md2                  01021  3143       3070
    01022 /dev/md2                  01022  3135       3074
    01023 /dev/md2                  01023  3117       3070
    01024 /dev/md2                  01024  1865       3361
    01025 /dev/md2                  01025  3579       5588
    01026 /dev/md2                  01026  3392       4411
    01027 /dev/md2                  01027  3367       4220
    01028 /dev/md2                  01028  3149       3512
    01029 /dev/md2                  01029  3141       3076
    01030 /dev/md2                  01030  3147       3074
    01031 /dev/md2                  01031  3160       3081
    01032 /dev/md2                  01032  3121       3071
    01033 /dev/md2                  01033  3125       3072
    01034 /dev/md2                  01034  3117       3074
    01035 /dev/md2                  01035  2885       3072
    01036 /dev/md2                  01036  2890       3074
    01037 /dev/md2                  01037  2541       3070
    01038 /dev/md2                  01038  2091       3074
    01039 /dev/md2                  01039  2332       3074
    01040 /dev/md2                  01040  2680       3070
    01041 /dev/md2                  01041  2122       3072
    01042 /dev/md2                  01042  2142       3074
    01043 /dev/md2                  01043  2106       3072
    01044 /dev/md2                  01044  2114       3074
    01045 /dev/md2                  01045  2385       3076
    01046 /dev/md2                  01046  2123       3074
    01047 /dev/md2                  01047  2559       3072


Maybe I should reboot, run bonnie and then [lp]vdisplay?

> I don't feel sure about your MD configuration either.
> 

Which part are you unsure about? I configured partitions on both
disks identically, and combined identical partitions into RAID-1
devices.


> Hope that spots some light on those numbers which differ from mine
> (typically LVM gives a performamce enhancement for sequential input).
> The mapping overhead of the LVM1 driver is in the sub percent order.
> 

Well, I suspected it must have been something I've done wrong,
but how do I fix this? Should I? Can it be?

Thanks,
Ron Arts


> Regards,
> Heinz    -- The LVM Guy --
> 
> 
>>Regards,
>>Ron Arts
>>
>>
>>Version  1.02c      ------Sequential Output------ --Sequential Input- --Random-
>>                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>>nbs-126.offic 2008M 24005  99 66015  49 16148   7 27430  98 86915  15 369.0   1  single disk
>>nbs-126.offic    2G 23422  99 70919  58 23800  11 25289  86 101485 17 433.4   1  s/w RAID-1
>>nbs-126.offic    2G  8152  99 49897  94 23092  27  9122  92 78056  38 331.1   2  s/w RAID-1 + LVM
>>nbs-126.offic 4032M 19695  99 44056  42 14179   9 21526  94 86450  16 344.3   1  h/w RAID-1
>>nbs-126.offic 4032M 19916  99 24033  22 13343   9 22794  99 111662 30 388.5   1  h/w RAID-5
>>                     ------Sequential Create------ --------Random Create--------
>>                     -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>>files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
>>nbs-126.office.n 16  2481  99 +++++ +++ +++++ +++  2424  99 +++++ +++  5508  98  single disk
>>nbs-126.office.n 16  2530  99 +++++ +++ +++++ +++  2437  99 +++++ +++  6062 100  s/w RAID-1 soft
>>nbs-126.office.n 16   800  99 +++++ +++ 12848  98   807  99 +++++ +++  2591  99  s/w RAID-1 + LVM
>>nbs-126.office.n 16  2138  98 +++++ +++ 31126  98  2200  99 +++++ +++  5322  98  h/w RAID-1
>>nbs-126.office.n 16  2182  99 +++++ +++ 27238  86  2172  98 +++++ +++  5261  97  h/w RAID-5
>>
>>
>>Notes:
>>
>>The last two are with hardware RAID (GDT 4513RZ), and 2Gb RAM instead of 1, but I adjusted
>>the -s parameter for bonnie++ accordingly.
>>
>>commandline:
>># ./bonnie++ -d /tmp -s 2048 -x2 -uroot
>>Results shown are for the second run. Machines were otherwise inactive, and carried a
>>minimum install.
> 
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Netland Internet Services
bedrijfsmatige internetoplossingen

http://www.netland.nl   Kruislaan 419              1098 VA Amsterdam
info: 020-5628282       servicedesk: 020-5628280   fax: 020-5628281

Look out for #1. Don't step in #2 either.

--------------ms070203070200070506030301
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJdjCC
AxkwggKCoAMCAQICAwdzkDANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUx
HTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVl
bWFpbCBSU0EgMjAwMC44LjMwMB4XDTAyMDUxMzEyNDI0OFoXDTAzMDUxMzEyNDI0OFowXDEN
MAsGA1UEBBMEQXJ0czERMA8GA1UEKhMIUm9uIFIuQS4xFjAUBgNVBAMTDVJvbiBSLkEuIEFy
dHMxIDAeBgkqhkiG9w0BCQEWEXJhYXJ0c0BuZXRsYW5kLm5sMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAsz1vQDs+fOlea3WOBrQay1HHCqENWzUhuaMzDYKduzVxGzwNmc7j
HnR0QflErghjp61ihnDQI1EF3NbIlSAne3fiCQ/9i2Ztbtxa1dlhzu3iZzMvCX4MDaIFwgk1
rkdVG2sVZwgjV9nvroVZoV3Mqgh2ev7Cd6USxG9yJ3HFaK/BntOhCnRv52jTPOFqlZfD37FH
XNmllxdmdfD7VKE7ssTr+wq336cm2uqqY0BEiovD1W6gyG2UXDBRo7ExhCroJzzirmsffW09
p5XTdzC5CO3tdYqz5rtUua5ED0AwJGK7WO4YO2jHRSg7jykc+XvSXvL9SdlhKMqeWt1b/im+
XQIDAQABoy4wLDAcBgNVHREEFTATgRFyYWFydHNAbmV0bGFuZC5ubDAMBgNVHRMBAf8EAjAA
MA0GCSqGSIb3DQEBBAUAA4GBABNzXukOa8Lhmw1d12+RvwFORDhX2FEy+iaXkG6RDTcctEuc
QBAebt1ialWEa3MAI5R7xKhkF78W/RilmHbSMr5MX3RfSnmi49n0+rzqtXDygci1PJfZFLSi
cNx8GreiFF9H1id3F0LmJpkc2WEEJxJ5ofKVpXjjrt1MkMm2X8KtMIIDGTCCAoKgAwIBAgID
B3OQMA0GCSqGSIb3DQEBBAUAMIGSMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2Vy
dGlmaWNhdGUgU2VydmljZXMxKDAmBgNVBAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAw
LjguMzAwHhcNMDIwNTEzMTI0MjQ4WhcNMDMwNTEzMTI0MjQ4WjBcMQ0wCwYDVQQEEwRBcnRz
MREwDwYDVQQqEwhSb24gUi5BLjEWMBQGA1UEAxMNUm9uIFIuQS4gQXJ0czEgMB4GCSqGSIb3
DQEJARYRcmFhcnRzQG5ldGxhbmQubmwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCzPW9AOz586V5rdY4GtBrLUccKoQ1bNSG5ozMNgp27NXEbPA2ZzuMedHRB+USuCGOnrWKG
cNAjUQXc1siVICd7d+IJD/2LZm1u3FrV2WHO7eJnMy8JfgwNogXCCTWuR1UbaxVnCCNX2e+u
hVmhXcyqCHZ6/sJ3pRLEb3InccVor8Ge06EKdG/naNM84WqVl8PfsUdc2aWXF2Z18PtUoTuy
xOv7Crffpyba6qpjQESKi8PVbqDIbZRcMFGjsTGEKugnPOKuax99bT2nldN3MLkI7e11irPm
u1S5rkQPQDAkYrtY7hg7aMdFKDuPKRz5e9Je8v1J2WEoyp5a3Vv+Kb5dAgMBAAGjLjAsMBwG
A1UdEQQVMBOBEXJhYXJ0c0BuZXRsYW5kLm5sMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEE
BQADgYEAE3Ne6Q5rwuGbDV3Xb5G/AU5EOFfYUTL6JpeQbpENNxy0S5xAEB5u3WJqVYRrcwAj
lHvEqGQXvxb9GKWYdtIyvkxfdF9KeaLj2fT6vOq1cPKByLU8l9kUtKJw3Hwat6IUX0fWJ3cX
QuYmmRzZYQQnEnmh8pWleOOu3UyQybZfwq0wggM4MIICoaADAgECAhBmRXK3zHT1z2N2RYTQ
LpEBMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgw
JgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVt
YWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAwMDAwWhcNMDQwODI3MjM1OTU5WjCBkjELMAkG
A1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8w
DQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQD
Ex9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNEKYpjNSptcDz63K737nRvMLwzkH/5
NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu2HL5ugL217CR3hzpq+AYA6h8Q0JQ
UYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQABo04wTDApBgNVHREEIjAgpB4wHDEa
MBgGA1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0TAQH/BAgwBgEB/wIBADALBgNVHQ8E
BAMCAQYwDQYJKoZIhvcNAQEEBQADgYEAMbFLR135AXHl9VNsXXnWPZjAJhNigSKnEvgilegb
SbcnewQ5uvzm8iTrkfq97A0qOPdQVahs9w2tTBu8A/S166JHn2yiDFiNMUIJEWywGmnRKxKy
QF1q+XnQ6i4l3Yrk/NsNH50C81rbyjz2ROomaYd/SJ7OpZ/nhNjJYmKtBcYxggMnMIIDIwIB
ATCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJ
Q2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZp
Y2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMHc5AwCQYF
Kw4DAhoFAKCCAWEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MDIxMDE2MTUwODU5WjAjBgkqhkiG9w0BCQQxFgQUKUnL+shQjg3y9JN6O3YhhUe+zc0wUgYJ
KoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga0GCyqGSIb3DQEJEAILMYGdoIGaMIGSMQsw
CQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24x
DzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMxKDAmBgNV
BAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwdzkDANBgkqhkiG9w0BAQEF
AASCAQBvLfd3jtbWCwtEGoP7q3D3qTn82pzA29weqz6dH+/ZmHkTo4qEs6L/oR4KoUgjQ+bj
q8LR3VTnCSI3FN/bzyjZ3X8MCPXkaUhdYUFlwf+z1M1XZZXDstRKTlWFlriKjbug+/IahV5x
Xl1r/2KpNJnwFqUjGplxLiX9xzTXErmSsqB7u1SjZ9E4hUHuLtvTbZrJWaB0CIULuZUciIJa
GjLzbugmepIxS2RuNt83oXXct+TeCTZUzTQogxUbGhZgIorbWaf8v+80OqjkejPaGE0wCGbJ
1qWjOEI60h6S0eWt7b5iEXpXMY52O2USXnIpJEzsETB+Z2gN8l2WYes0na9DAAAAAAAA
--------------ms070203070200070506030301--
