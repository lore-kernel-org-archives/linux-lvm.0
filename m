Message-ID: <20040127231215.91807.qmail@web80401.mail.yahoo.com>
From: Chris Conn <cmcgoat@swbell.net>
MIME-Version: 1.0
Subject: [linux-lvm] multi-disk vg?
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
Date: Tue Jan 27 18:13:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

I've finally finished setting up my Slackware 9.1 box
with LVM and ReiserFS, here's what I've got:

disk 0 (one partition)
 
   /dev/mainvg/root          /
   (and swap space)

disk 1 (two partitions)

   /dev/rootvg/usr           /usr
   /dev/rootvg/var           /var
   /dev/rootvg/tmp           /tmp

   /dev/datavg/home          /home
   /dev/datavg/data          /data

I set up rootvg and datavg first and then last night
I followed the LVM How-To and converted the setup the
mainvg VG with root. All works well.

Now I'm wondering if I can merge mainvg and rootvg
as one VG though they're on two seperate disks. Is this
possible? And if so is it a good idea? 

BTW I left /etc in / because I had trouble mounting it
as a seperate filesystem with /etc/fstab.

Thanks for any advice, 

=====
Chris Conn   
cmcgoat@swbell.net   http://storm.cadcam.iupui.edu/~cmcgoat
Austin, TX
