Date: Tue, 5 Oct 2010 15:33:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTi=qEQ31PqyXJBzLtNR04NrZ1exgk+pYYpOw=bo4@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010051530450.1511@bmsred.bmsi.com>
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
	<4CAB14C9.7040707@redhat.com> <4CAB480A.8050906@cfl.rr.com>
	<AANLkTim9VZQ2Ki4EDWnGAM3GbGz7CacmBf8y=2MnLhy3@mail.gmail.com>
	<Pine.LNX.4.64.1010051439470.1511@bmsred.bmsi.com>
	<AANLkTi=qEQ31PqyXJBzLtNR04NrZ1exgk+pYYpOw=bo4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-2001782264-1286307195=:1511"
Subject: Re: [linux-lvm] moving an LVM as an ISO can be moved
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sugupta@redhat.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-2001782264-1286307195=:1511
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Oct 2010, Tapas Mishra wrote:

> On Wed, Oct 6, 2010 at 12:14 AM, Stuart D. Gathman <stuart@bmsi.com> wrot=
e:
> >
> > Not sure what you mean by "boot from that". =EF=BF=BDSince you are play=
ing
> > with virtual machines, perhaps you mean something like:
> >
> > losetup /dev/loop0 /nfs/location/to/store
> > ... pass /dev/loop0 to a Virtual machine
> Yes
> > (likely to be slow - you probably want a SAN instead)
> Hmm I do not have a SAN,

Start up an iSCSI server on another host, and you have a SAN.
Export LVs via iSCSI and mount them as drives on other hosts.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-2001782264-1286307195=:1511--
