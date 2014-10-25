Received: from [10.36.7.95] (vpn1-7-95.ams2.redhat.com [10.36.7.95])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PMlqgK004446
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 18:47:53 -0400
Message-ID: <544C2897.6020708@redhat.com>
Date: Sun, 26 Oct 2014 00:47:51 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>	<544B9ADD.6040607@redhat.com>	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
In-Reply-To: <CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------020706010307030409060503"
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Cc: LVM <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------020706010307030409060503
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Dne 25.10.2014 v 22:53 Vasiliy Tolstov napsal(a):
> 2014-10-26 0:18 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> There is 'internal' metadata archive then -
>>
>> dd if=/dev/your_pv_volume  of=/tmp/1st.megabyte   bs=1M count=1
>>
>> It's will capture first megabyte of your PV where are embedded
>> metadata of your Volume group.
>>
>> If you are not skilled enough - tar.gz and send this file to me.
>
>
> I'm do dd and send it. While i'm break thin pool i'm try to restore volume 2657.
> But i don't stop lvm thin pool =(.
>


 From the metadata  something bad was going one:

Fri Oct 24 17:03:04 2014

transaction_id = 120  - create = "3695"

And suddenly on Fri Oct 24 18:07:23 2014
pool is back on older transaction_id

transaction_id = 114


Is that the time of your vgcfgrestore?

I'm attaching those metadata which you likely should put back to get in sync
with your kernel metadata (assuming you have not modified those in any way)

Zdenek


--------------020706010307030409060503
Content-Type: text/plain; charset=UTF-8;
 name="recov"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="recov"

vg1 {
id = "jP49rT-lpl1-NHqu-5jHZ-gy5z-uv6v-YH9w7d"
seqno = 256
format = "lvm2" # informational
status = ["RESIZEABLE", "READ", "WRITE"]
flags = []
extent_size = 8192
max_lv = 10000
max_pv = 0
metadata_copies = 1

physical_volumes {

pv0 {
id = "hm3gZp-FjPP-AAbl-NEX3-n30T-x1Nw-9eiTw5"
device = "/dev/sdb"

status = ["ALLOCATABLE"]
flags = []
dev_size = 943718400
pe_start = 615425
pe_count = 115124
}
}

logical_volumes {

tp1 {
id = "Xk3HRX-XZSg-Fzge-Ut13-Ocxu-oegX-8gXbM2"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1407945259
segment_count = 1

segment1 {
start_extent = 0
extent_count = 113920

type = "thin-pool"
metadata = "tp1_tmeta"
pool = "tp1_tdata"
transaction_id = 120
chunk_size = 128
discards = "passdown"
zero_new_blocks = 1

message1 {
create = "3695"
}
}
}

2735 {
id = "odXzLP-K0MG-lffg-SvH7-s3Gn-hdlJ-qNDhI6"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413304951
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 59
device_id = 15
}
}

2799 {
id = "gze0LC-Kim7-tpP3-LwW8-82LJ-DLJf-5rnfSU"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413332125
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 60
device_id = 16
}
}

2749 {
id = "3TokZu-3nWx-mWcv-XQY2-S1lY-VRCZ-pdszYr"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413484929
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 67
device_id = 20
}
}

3119 {
id = "jscAdT-PGuM-b80R-pwg4-5DlY-4bMf-e5Ybg0"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413488295
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 68
device_id = 21
}
}

2679_751 {
id = "hoSlsB-eZJ0-gbrh-P3aL-5U8T-Erc0-7skUnq"
status = ["READ", "WRITE", "VISIBLE"]
flags = ["ACTIVATION_SKIP"]
creation_host = "cn05"
creation_time = 1413740222
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 85
device_id = 28
}
}

3435 {
id = "8xgMUd-pBtZ-U0Rs-qytl-XeC2-J8wb-QxLoez"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413983820
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 95
device_id = 30
}
}

3471 {
id = "eHumdz-bxzn-7H1N-hGm1-2c7R-MSEu-nwwvUe"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1413991440
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 97
device_id = 31
}
}

2937_785 {
id = "H0Fqvl-xniV-FCE8-Eh86-Xfwb-bnb6-wzDVzO"
status = ["READ", "WRITE", "VISIBLE"]
flags = ["ACTIVATION_SKIP"]
creation_host = "cn05"
creation_time = 1413992701
segment_count = 1

segment1 {
start_extent = 0
extent_count = 40960

type = "thin"
thin_pool = "tp1"
transaction_id = 98
device_id = 32
}
}

3547 {
id = "EEPlcg-dBrQ-fclB-MJMi-HQBY-MG9B-gPimpS"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1414060010
segment_count = 1

segment1 {
start_extent = 0
extent_count = 40960

type = "thin"
thin_pool = "tp1"
transaction_id = 109
device_id = 33
}
}

3645 {
id = "f8WN0H-dcYX-p5YZ-evnU-dZlQ-7ayZ-tMvE9Q"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1414135683
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 117
device_id = 34
}
}

3647 {
id = "IrDJ48-H0Nb-QOLa-eTAk-ralE-NM1w-Pfkx6J"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1414135684
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 118
device_id = 35
}
}

3695 {
id = "0ZHo7z-aIqP-tiij-URcc-HsZp-9fzF-Wc38Ll"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
creation_host = "cn05"
creation_time = 1414155784
segment_count = 1

segment1 {
start_extent = 0
extent_count = 5120

type = "thin"
thin_pool = "tp1"
transaction_id = 119
device_id = 36
}
}

lvol0_pmspare {
id = "tznz20-2upf-S3Mu-RQLX-nu7g-giVI-yU2fMN"
status = ["READ", "WRITE"]
flags = []
creation_host = "cn05"
creation_time = 1407945259
segment_count = 1

segment1 {
start_extent = 0
extent_count = 155

type = "striped"
stripe_count = 1	# linear

stripes = [
"pv0", 0
]
}
}

tp1_tmeta {
id = "bwjbfk-4Yd3-3nbm-DpVC-jYGc-G5Go-gy0Dt1"
status = ["READ", "WRITE"]
flags = []
creation_host = "cn05"
creation_time = 1407945259
segment_count = 1

segment1 {
start_extent = 0
extent_count = 155

type = "striped"
stripe_count = 1	# linear

stripes = [
"pv0", 114075
]
}
}

tp1_tdata {
id = "g0NIO3-pyRi-aEvU-v0zp-2707-juvr-Ob2jG8"
status = ["READ", "WRITE"]
flags = []
creation_host = "cn05"
creation_time = 1407945259
segment_count = 1

segment1 {
start_extent = 0
extent_count = 113920

type = "striped"
stripe_count = 1	# linear

stripes = [
"pv0", 155
]
}
}
}
}
# Generated by LVM2 version 2.02.106(2) (2014-04-10): Fri Oct 24 17:03:04 2014

contents = "Text Format Volume Group"
version = 1

description = ""

creation_host = "cn05"	# Linux cn05 3.10-3-amd64 #1 SMP Debian 3.10.49-1+0~20140721094239.35+wheezy~1.gbp298443 ( x86_64
creation_time = 1414155784	# Fri Oct 24 17:03:04 2014

--------------020706010307030409060503--
