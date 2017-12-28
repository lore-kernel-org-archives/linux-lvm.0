From: Eric Ren <zren@suse.com>
Message-ID: <4c07ee03-0ff8-9d41-ef93-c47e5325bb1c@suse.com>
Date: Thu, 28 Dec 2017 16:30:09 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Subject: [linux-lvm] lvmlockd manpage: prevent concurrent activation of
	logical volumes?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: roger zhou <zzhou@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

I's afraid the statement below in description section of lvmlockd manpage:

"
=C2=B7 prevent concurrent activation of logical volumes
"

is easy for normal user to mistake it as: wow, lvmlockd doesn't support=20
active-active
LV on multiple nodes?

What I interpret from it is:

with clvmd, 'vgchange/lvchange -ay' activates the LV on every node in a=20
shot.
But with lvmlockd, one needs to perform:

- start the lockspace
vgchange --lockstart vg1

- vgchange -ay vg1
The LVs in vg1 will only be activated on this node.

Regards,
Eric
