Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Wed, 18 Jul 2001 17:22:59 -0500
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <66750000.995494979@duke.wrkhors.com>
In-Reply-To: <20010718212300.E26849@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com


-- Ragnar Kj=F8rstad <lvm@ragnark.vestdata.no> on 07/18/01 21:23:01 +0200

> On Wed, Jul 18, 2001 at 10:33:21AM +0100, Joe Thornber wrote:
>> This comment is interesting:
>> =
>> "Seagate uses horizontal mapping with this drive, so that it reaches
>> maximum performance at the beginning of the medium, decreasing at the
>> end of the medium."
>> =
>> So obviously this varies from drive to drive.
> =
> You can use zcav from the bonnie++ package
> (http://www.coker.com.au/bonnie++) to find the transfer-rates for your
> drive. I believe finding seek times is a little more tricky since it
> depends on where you're seeking from and that will depend on your
> application.

It is particularly tricky on SCSI's since they remap
bad blocks internally.  You can end up with a butterfly
read due to bad blocks without knowig it.  SCSI's and
the controllers can also silently do scatter/gather on
I/O which helps performance but can cause serious pain =
for benchmarks.

:-)
