Message-ID: <3FF5AC86.A38E2357@groupe-ips.com>
From: Jean Marie =?iso-8859-1?Q?Ari=E8s?= <jeanmarie.aries@groupe-ips.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Understand the snapshot process
References: <3FF277FF.1D5400B4@groupe-ips.com>
		 <1072905045.15299.38.camel@grandmother.littlebald.com>
		 <3FF51A81.DC58AC89@groupe-ips.com> <1073061541.24004.6.camel@grandmother.littlebald.com>
Content-Transfer-Encoding: 8bit
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
Date: Fri Jan  2 11:40:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Ok. In other sentence, the life of the snapshot is the time between the lvcreate
-s and the lvremove command. The data must be saved if we need old files.

So the snapshot is only a good solution to backup the data update every time ?



David Johnston a �crit :

> On Fri, 2004-01-02 at 02:15, Jean Marie Ari�s wrote:
> > Great !
> >
> > Your explanation is perfect :o)
> >
> > So, I understand better the use of a snapshot.
> >
> > The /data contains files sharing with Samba. So, I think I can do one
> > snapshot per day at midnight, and remove it immediatly. If I have to restore
> > data for the snapshot, its's alway possible to mount the /dev/OVG/snap_admin
> > ?
>
> Jean Marie,
> I'm not sure I understand what you accomplish this way.  Do you mean to
> say that you would remove yesterday's snapshot and create a new one at
> midnight each night?  This protects you from accidents ("rm -f /data")
> but not from someone who needs last Friday's version of a file.
>
> If you need the data in the snapshot, you need to put it somewhere safe.
>
> To summarize:
> 1. Unmount /data
> 2. Make the snapshot
> 3. Remount /data
> 4. Mount the snapshot
> 5. Back up the snapshot (copy the data to tape, cd, whatever)
> 6. Unmount the snapshot
> 7. Remove the snapshot
>
> -David
> --
> David Johnston <david@littlebald.com>
> Little Bald Consulting, LLC
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--
Sinc�rement,

Jean Marie Ari�s
Imprimeries IPS
Responsable Syst�mes/R�seaux
