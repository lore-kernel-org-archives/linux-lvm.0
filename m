Message-ID: <4FE0AB92.7020400@redhat.com>
Date: Tue, 19 Jun 2012 17:40:50 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
In-Reply-To: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM2 recovery on IP-SAN after OS re-install
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/28/2012 07:40 PM, tariq wali wrote:
> I tried to fix this by but it just won't go.. vgreduce
> --removemissing vg0 Found duplicate PV
> XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1 
> Volume group "vg0" is already consistent
> 
> why does LVM think that it's still using PV ( /dev/sdc1 ) when it
> no more exists ? and how do i get rid of it ?

Although you have removed the PV from the volume group it still has a
PV label on it which has the same UUID value as some other valid
device that is part of the volume group.

You should verify which device is correct and then remove the PV label
from the other device (or re-run pvcreate to give it a new random UUID):

# pvremove /dev/sdc1

Once the label is removed you should stop seeing those messages.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/gq5EACgkQ6YSQoMYUY97zTACdEn2l2OkwM/4naoqzZwJFDSiO
WpYAnjSN8Uppia//lZK28FnhXvyDwK+Y
=v7ST
-----END PGP SIGNATURE-----
