Message-ID: <4016EE45.1050300@gene.concordia.ca>
From: Chris Beck <cbeck@gene.concordia.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM Snapshots for remote archiving.
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
Date: Tue Jan 27 18:05:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Hi!  I've been looking through the archives and I can't see anything=20
addressing my issue.  Probably because I didn't look hard enough.

I want to use 24-hour snap shots as an archival tool.
I have 2 identical file servers, one primary and one as an off-site=20
mirror.  I'd like the primary system to generate a transaction log that=20
rolls over every 24-hours and gets transmitted to the remote site. =20
After 7 days on the remote site, the log gets triggered so the remote is=20
always 7 days out of sync but with the last 6 days logs ready to go.   I=20
could have it auto update on arrival, but I was thinking that allowing a=20
week for someone to realize that they deleted something vital would be a=20
good thing(TM) - standard archiving stuff I guess.

Do you think that lvm snapshot volumes are a simple and convenient way=20
of doing this?  Does this make sense at all?

Thanks,
Chris

--=20
Chris Beck / Y.A.B.A. / Fungal Genomics
CFSG / Concordia University
"La loi dans sa majestueuse =C3=A9galit=C3=A9, interdit =C3=A0 tous, aux =
riches comme
aux pauvres de dormir sous les ponts, de coucher dans la rue et de voler
du pain." -- Anatole France (Les Lys Rouge - 1894)
