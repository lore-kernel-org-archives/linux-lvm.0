Date: Wed, 29 Dec 1999 12:50:45 -0800 (PST)
From: Adam Crews <acrews@cisco.com>
Subject: Re: [linux-lvm] lvextend
In-Reply-To: <19991229110622.A456@suse.de>
Message-ID: <Pine.LNX.4.10.9912291243350.5737-100000@scooby.cisco.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Herschel <Fabian.Herschel@suse.de>
Cc: linux-lvm@msede.com


Yes I do want one big lv.  I used lvm so that as I add disks I can just
grow the fs without needing to re-do md devices or things like that.

What I figured out is that you cannot extend a striped lv.  even if I have
2 partitions to add to a lv that has 2 stripes, I still cant extend the
volume.

I needed the space so I took a backup, re-created the lv, and just
concatinated it this time instead of the stripes.  so next time I add a
disk, I'll be able to grow the lv and fs.

-Adam

On Wed, 29 Dec 1999, Fabian Herschel wrote:

| Hello,
| 
| On Tue, Dec 28, 1999 at 11:09:14AM -0800, Adam Crews wrote:
| > Hello,
| > 
| > I am having problems trying to extend a lv.
| > 
| > [root@scooby /root]# lvextend -v -l+6514 /dev/mirror_vg/mirror_lv 
| 
| Just a question back, do you realy want to extend the lv with 6514 *extentds*? So you would
| have a vg with just one lv which allocates the complete space of the vg.
| What says lvdisplay /dev/mirror_vg/mirror_lv?
| Does lvextend -v -l+6513 /dev/mirror_vg/mirror_lv work? The last line is to test, if there could be an error
| in the handling of the last extend.
| 
| Greetings Fabian Herschel
| 
| -----------------------------------------------------------------------
| Fabian Herschel                                 SuSE Rhein/Main AG     
| Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
| Fax:    +49-6196-409-607                        D-65760 Eschborn
| mailto: Fabian.Herschel@suse.de                 http://www.suse.de      
| 
