Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1IH81i02602
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 12:08:01 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i1IH80W16957
	for linux-lvm@redhat.com; Wed, 18 Feb 2004 11:08:00 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2: vgscan is long...
Message-ID: <20040218110800.E13067@homer.msp.redhat.com>
References: <1077122257.2134.12.camel@xeyrus>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1077122257.2134.12.camel@xeyrus>; from dchenard@croesus.com on Wed, Feb 18, 2004 at 11:37:38AM -0500
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 12:07:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

On Wed, Feb 18, 2004 at 11:37:38AM -0500, Daniel Ch=EF=BF=BDnard wrote:
> In my lvm.conf, I have set my filter=20
=20
> filter =3D [ "a|hda*|", "a|hdb*|", "a|hdc*|" ]
> filter =3D [ "r|cdrom|", "r|hdd*|" ]
=20
Only one filter applies: merge them into one line.
e.g.=20
  filter =3D [ "a|hda*|", "a|hdb*|", "a|hdc*|", "r|.*|" ]=20

And if this is 2.6, you may find the LVM2 source code in CVS runs faster.

Alasdair
--=20
agk@redhat.com
