Message-ID: <2933.10.10.184.36.1048810470.squirrel@webmail.mcc.edu>
From: <rschapel@edtech.mcc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] A little Cluster/Newbie help pls!
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
Date: Thu Mar 27 18:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok, well I have been pouring over the archives for a little while now, and
just haven't found what I was looking for so be prepared for some newbie
ness.  (Also went through the FAQ)

Currently I have a goal to setup a nice little active-active fail-over
cluster. We are going to be using this cluster for samba file service to a
semi large group of users. I don't intend to use a GFS file system to
actually access the same data at the same time (GFS is $$ correct?) so I
was going to create separate partitions on a shared external scsi box (I
am using a couple of Dell 2650's (with PERC 3/DC's Raid cards) and a PV
220 with number 73 gig drives) I was going to setup two separate raid
sets, and just fail over a raid set in case of problems. But during my
quest of finding out info, it seems like these cards can actually can
share the same raid set at the same time (anybody else ever do this? am I
off my rocker?). This leads me to think that LVM would be perfect for this
scenario. That is if LVM can handle be accessed by the cluster. I was
thinking this might be possible since I would be making separate LV's. Am
right in thinking that this will save me a disk (one) from having do
parity, and give me the option to move space around. Of course this could
just ranting all around. =) Is this possible? Is it a horrible Idea? I
realize there is going to be the possibility for the "split brain"
problem, is there ways to guard against this? I was thinking of using some
well timed external powerswitch boxes to help avoid this issue. Is it just
not worth the risk?  I am hoping some you people have had more experience
with this might be able to send some wisdom!


--Randy Schapel
Educational Systems
Mott Community College
