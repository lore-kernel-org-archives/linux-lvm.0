Subject: Re: [linux-lvm] A little Cluster/Newbie help pls!
From: Matt Schillinger <mschilli@vss.fsi.com>
In-Reply-To: <2933.10.10.184.36.1048810470.squirrel@webmail.mcc.edu>
References: <2933.10.10.184.36.1048810470.squirrel@webmail.mcc.edu>
Content-Transfer-Encoding: 7bit
Message-Id: <1048862540.7750.2.camel@mosix>
Mime-Version: 1.0
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
Date: Fri Mar 28 08:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

To give a short answer to your question concerning LVM, YES!, LVM will
work for your concept. I have put together an active-active NFS/Samba
cluster (2 nodes) with heartbeat. I'll email you directly for info, as
other than LVM being used, it's not particularly suited to the LVM list.

As a side note, there is OpenGFS ( i don't know where it is in
alpha/beta release, but it is open source).

Matt Schillinger
mschilli@vss.fsi.com



On Thu, 2003-03-27 at 18:14, rschapel@edtech.mcc.edu wrote:
> Ok, well I have been pouring over the archives for a little while now, and
> just haven't found what I was looking for so be prepared for some newbie
> ness.  (Also went through the FAQ)
> 
> Currently I have a goal to setup a nice little active-active fail-over
> cluster. We are going to be using this cluster for samba file service to a
> semi large group of users. I don't intend to use a GFS file system to
> actually access the same data at the same time (GFS is $$ correct?) so I
> was going to create separate partitions on a shared external scsi box (I
> am using a couple of Dell 2650's (with PERC 3/DC's Raid cards) and a PV
> 220 with number 73 gig drives) I was going to setup two separate raid
> sets, and just fail over a raid set in case of problems. But during my
> quest of finding out info, it seems like these cards can actually can
> share the same raid set at the same time (anybody else ever do this? am I
> off my rocker?). This leads me to think that LVM would be perfect for this
> scenario. That is if LVM can handle be accessed by the cluster. I was
> thinking this might be possible since I would be making separate LV's. Am
> right in thinking that this will save me a disk (one) from having do
> parity, and give me the option to move space around. Of course this could
> just ranting all around. =) Is this possible? Is it a horrible Idea? I
> realize there is going to be the possibility for the "split brain"
> problem, is there ways to guard against this? I was thinking of using some
> well timed external powerswitch boxes to help avoid this issue. Is it just
> not worth the risk?  I am hoping some you people have had more experience
> with this might be able to send some wisdom!
> 
> 
> --Randy Schapel
> Educational Systems
> Mott Community College
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
