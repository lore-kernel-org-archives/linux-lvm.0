Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
References: <m2u2ajmunl.fsf@puma.redeye> <20001011084555.A6983@omnifarious.mn.org>
From: Andy Cowling <andy@redeye.com>
Date: 11 Oct 2000 17:28:22 +0100
In-Reply-To: "Eric M. Hopper"'s message of "Wed, 11 Oct 2000 08:45:55 -0500"
Message-ID: <m23di3l4ux.fsf@puma.redeye>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Thanks to all for your help. I'm using reiserfs and on SuSE 7.0, the
resize utility was hidden away in /sbin/resize_reiserfs.

I have resized the file system to 90G successfully but, there always a
but isn't there :-), df now reports a total of 88Gb.

Out of interest is this due to rounding or reisfer/LVM housekeeping ?

# umount /lv01
# resize_reiserfs -s90000M /dev/vg01/lv01
ReiserFS report:
blocksize             4096
block count           23040000 (7864320)
free blocks           18466724 (3291508)
bitmap block count    704 (240)

Syncing..done
# mount /lv01
# df -h /lv01
Filesystem            Size  Used Avail Use% Mounted on
/dev/vg01/lv01         88G   17G   70G  20% /lv01

PS. In case you're wondering what I did to deserve such a high-powered
workstation, this m/c is a 4 proc, 2Gb RAM Dell PowerEdge 6400 server
running an Oracle 8 data warehouse.
