Subject: RE: [linux-lvm] LVM for a Database
From: "Kirby C. Bohling" <kbohling@birddog.com>
In-Reply-To: 
	<8075D5C3061B9441944E137377645118012DB3@cinshrexc03.shermfin.com>
References: 
	<8075D5C3061B9441944E137377645118012DB3@cinshrexc03.shermfin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1038351396.24642.312.camel@hawk.birddog.com>
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
Date: Wed Nov 27 09:47:20 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2002-11-26 at 16:09, Rechenberg, Andrew wrote:
> 
> You're going to get better performance if you have /dev/sd[b-e] and then
> span across those devices or use LVM striping.  That is RAID10.
> 

You can't possibly know that without knowing several facts.

A lot of times independent disk heads is much then not.  Specifically,
the journal should definitely be put on a different set of disks then
the straight data.  For reliability, and for speed.

What database is he running (Oracle, PostGres, DB2, MySQL, Sybase,
Informix).

What kind of database is it?  In Oracle speak, is it decision support,
or online transaction based.

It is doing warehousing of bulk data that is almost never written to?

What's the priority, uptime or throughput? (You make different decisions
based on this).

Do you have seperate disks for your journals/logs/archives?  If not, you
have to take that into account for your recovery.

I know a lot of DBA's always say more independant spindles is better. 
However, our last set of DBA's, showed that wasn't the case for our
production database, because 4 disks worked really hard, while 12 sat
idle. So we put 14 of them together in a RAID10, and left 2 out (not
even mirrored).  The two raw disks are used for the redo logs, and the
spare copies of the control files.  While the 14 disks are used for all
the datafiles.  Including the indexes and the data (which is really
stupid according to everything I have ever read reguarding Oracle
tuning).  However, in this case it worked.

The right answer for him is to setup as many configurations as he can,
and put as close to a production load as he can manage onto it.

	Thanks,
		Kirby



> I have a Dell 6600 with two PowerVault 220S with the second
> configuration (12 RAID1 arrays, /dev/sd[c-n]) and then use Linux
> software RAID0 to stripe across those 12 RAID1 arrays.  It gives fairly
> good performance.
> 
> I don't have LVM on top of the RAID0, but I will be doing just that in
> the near future and I can post the results here if you wish.
> 
> Regards,
> Andy.
> 
> -----Original Message-----
> From: Joseph Kezar [mailto:jkezar@doc.state.vt.us] 
> Sent: Tuesday, November 26, 2002 3:29 PM  
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] LVM for a Database
> 
> 
> We are in the process of building a database on a 4 processor 1.8GHz,
> 4GB RAM Dell 6650.
> 
> I am trying to figure out the most efficient way to use LVM for our raw
> data storage.  We have a RAID array with 8x36GB drives in it.  Should I
> do a raid 1+0(mirror 4 disks, and span them to get one logical volume)?
> 
> If so this leaves me a /dev/sdb.  Or would I get better performance if I
> mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].
> Is it possible to figure out where the center of our spindles are?  So I
> can arrange for the heads to spend little time seeking?
> 
> Any perfomance hints would be greatly appreciated.
> 
> thanks
> Joe K.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
-- 
Real Programmers view electronic multimedia files with a hex editor.
