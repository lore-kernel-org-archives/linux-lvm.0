From: pll+lvm@lanminds.com
Subject: Re: [linux-lvm] How to best use LVM? 
References: <Pine.LNX.4.44.0208161735420.28115-100000@dragon.inside.ntisys.com>
In-reply-to: Your message of "Fri, 16 Aug 2002 17:48:17 EDT."
             <Pine.LNX.4.44.0208161735420.28115-100000@dragon.inside.ntisys.com> 
Message-Id: <20020819144432.3D6DDF90E@tater>
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
Date: Mon Aug 19 09:45:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In a message dated: Fri, 16 Aug 2002 17:48:17 EDT
bscott@ntisys.com said:

>On Fri, 16 Aug 2002, at 11:05am, pll+lvm@lanminds.com wrote:
>> Now, the question is, how to deal with all this disk space.  For the 
>> particular systems I'm using, the basic disk configuration is 4 80GB 
>> IDE drives partitioned thusly:
>> 
>> 	/dev/hda5	487M	/
>> 	/dev/hda1	130M	/boot
>> 	/dev/hda6	4.9G	/usr
>> 	/dev/hda7	4.9G	/var
>> 	/dev/hda8	66GB	empty
>
>  Since you describe the Storage Nodes as being little more than a Network
>Block Device, that layout seems wrong to me.  I would aim for a totally
>stripped down, absolute bare minimum for the SNs.  Say you fit the whole
>system into 100 MB.  So create a 100 MB partition on each local drive.  The
>system goes into the 100 MB partition on the first disk.  The other three
>are ignored.

Well, yes and no.  See, these other SNs, are also pulling double duty 
as servers of various kinds; DNS, web, install server (FAI), etc.  
But those services obviously do not need nearly as much disk space on 
them as they happen to have.  Which is what led me to the idea of 
just using one system as an Access Node to export NFS/CIFS, and 
manage the remainder of the disk space via LVM.

I was planning on mirroring across SNs using Linux's SW RAID, and I 
had considered doing a 4-way mirror of the boot partition on each 
node as well, but I wanted to conquor the NBD-SN-AN idea first :)

-- 

Seeya,
Paul
--
	It may look like I'm just sitting here doing nothing,
   but I'm really actively waiting for all my problems to go away.

	 If you're not having fun, you're not doing it right!
