Subject: Re: [linux-lvm] Understand the snapshot process
From: David Johnston <david@littlebald.com>
In-Reply-To: <3FF51A81.DC58AC89@groupe-ips.com>
References: <3FF277FF.1D5400B4@groupe-ips.com>
	 <1072905045.15299.38.camel@grandmother.littlebald.com>
	 <3FF51A81.DC58AC89@groupe-ips.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1073061541.24004.6.camel@grandmother.littlebald.com>
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
Date: Fri Jan  2 10:40:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, 2004-01-02 at 02:15, Jean Marie Ari=E8s wrote:
> Great !
>=20
> Your explanation is perfect :o)
>=20
> So, I understand better the use of a snapshot.
>=20
> The /data contains files sharing with Samba. So, I think I can do one
> snapshot per day at midnight, and remove it immediatly. If I have to rest=
ore
> data for the snapshot, its's alway possible to mount the /dev/OVG/snap_ad=
min
> ?

Jean Marie,
I'm not sure I understand what you accomplish this way.  Do you mean to
say that you would remove yesterday's snapshot and create a new one at
midnight each night?  This protects you from accidents ("rm -f /data")
but not from someone who needs last Friday's version of a file.

If you need the data in the snapshot, you need to put it somewhere safe.


To summarize:
1. Unmount /data
2. Make the snapshot
3. Remount /data
4. Mount the snapshot
5. Back up the snapshot (copy the data to tape, cd, whatever)
6. Unmount the snapshot
7. Remove the snapshot

-David
--=20
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
