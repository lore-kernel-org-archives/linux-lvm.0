From: Oliver Jovic <jovi@unixag-zw.fh-kl.de>
In-Reply-To: <C1256BB3.001B923F.00@grz_notes_mta.grznord.de>
Message-Id: <Pine.LNX.4.33.0205081213340.3518-100000@diablo.unixag-zw.fh-kl.de>
MIME-Version: 1.0
Subject: [linux-lvm] offtopic but ...
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
Date: Wed May  8 07:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

after searching the web for a while i now bother you with my wish. ;-)

Well i use LVM now already for nearly 2 years and had in this time 2 big
problems (some harddisks gave up) where i lost nearly everything. I tried
to restore the LVM and filesystem but well if you lose 1/4 of your
LVM its really hopeless (or maybe I just didnt know how ;-P coz the
howto's to this question where well not very helpfull).

What i would like  is a solution which is between LVM and a RAIDx. LVM
has in my eyes the disadvantage that you create a filesystem over different
drives/partitions. If you lose one you nearly lose everything.
With a RAID you lose a harddrive/partition (diskspace) to build it (more
costs for harddrives and maybe a controller).

The solution between would be that all drives still have their own
'filesystem'. The logical unit would just need to spread the
directories/files over the allocated drives/partitions and keep on at
least 2 drives something like a index (maybe just one file like
ext3 is using it) file where the dirs have to go logicaly if you browse
through the logical unit. If one drive would fail you would have still the
rest. Some directories would be maybe missed but well at least the rest would
still be accessable. If there would be a chronical component in combination
with a smaller raid all newer files could first pass on the raid and then
went onto a unsecure part of the logial volume (not LVM). A scheduler
could relocate all dirs at some times so that all drives have the same level
of usage (diskspace).

Well, because i am not a programmer i am passing this idea to you readers.
Maybe somebody has already programmed something like that, then please let
me know. If not maybe somebody wants to. I guess it shouldnt be sooo
difficult. Anyways, let me know if possible. Maybe i can give some more
ideas or explain it better.

Thanks for reading. :-)

OJ
