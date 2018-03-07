MIME-Version: 1.0
In-Reply-To: <CABZYMH5UEDWhO30KiZ1xVe1z+S0pA4DR_yJ8TQ1sCYK48+0d9g@mail.gmail.com>
References: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
	<20180305165926.GA20527@redhat.com>
	<CABZYMH5UEDWhO30KiZ1xVe1z+S0pA4DR_yJ8TQ1sCYK48+0d9g@mail.gmail.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 7 Mar 2018 15:11:18 +0800
Message-ID: <CABZYMH74+CjXCZk6GdHsCc0wG7p1yiFQ0hA4bEyO087=4+gckQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a114fee300056be0566cd44c1"
Subject: Re: [linux-lvm] [lvmlockd] Refresh lvmlockd leases after sanlock
	changes
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

--001a114fee300056be0566cd44c1
Content-Type: text/plain; charset="UTF-8"

Besides, during migrating, libvirt will make sure only one host is using
(read/write) the lv,
and I'm trying to find a way to deactivate lv after migrating, so that
there's always
only one host has I/O on a thin lv.

Damon

--001a114fee300056be0566cd44c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Besides, during migrating, libv=
irt will make sure only one host is using (read/write) the lv,=C2=A0</div><=
div class=3D"gmail_extra">and I&#39;m trying to find a way to deactivate lv=
 after migrating, so that there&#39;s always=C2=A0</div><div class=3D"gmail=
_extra">only one host has I/O on a thin lv.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Damon</div></div>

--001a114fee300056be0566cd44c1--
