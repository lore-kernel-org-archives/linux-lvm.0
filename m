Return-Path: <Ron.Vissers@qtiworld.com>
Message-ID: <139803A793E0D311AFF60050DA2BC540030214D3@qtiexch1.qgraph.com>
From: "Vissers, Ron" <Ron.Vissers@qtiworld.com>
Subject: RE: [linux-lvm] Lost my physical volume on reboot?
Date: Mon, 2 Jul 2001 15:53:46 -0500 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi,
I only had one physical volume under lvm control.  Here are the results:

(rvissers:root) /home/rvissers/lvm_uuid/uuid_fixer # ./uuid_fixer /dev/hdc1
/dev/hdc1 - pv_read(): pv_create_name_from_kdev_t

(rvissers:root) /home/rvissers/lvm_uuid/uuid_fixer # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes

I'm thinking I either misunderstood something in the readme, or something
else is an issue.

Ron

     _/_/   _/_/_/_/_/ _/_/_/   Ron Vissers
  _/    _/     _/       _/      IT Systems & Operations Team Lead
 _/  _/_/     _/       _/       Quad/Tech International 
_/    _/     _/       _/        ph:414-566-7643  fx:262-246-1545
 _/_/  _/   _/     _/_/_/       Ron.Vissers@qtiworld.com


-----Original Message-----
From: AJ Lewis [mailto:lewis@sistina.com]
Sent: Monday, July 02, 2001 11:55 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Lost my physical volume on reboot?


On Mon, Jul 02, 2001 at 11:15:52AM -0500, Vissers, Ron wrote:
> Bear with me, I'm new to LVM in Linux.  More accustomed to HPUX.
> 
> Anyway, I seem to have lost my /dev/hdc1 physical volume and my /dev/vg02
> volume group, etc.  
> 
> Suggestions on where to begin?

Try my uuid_fixer at
ftp://ftp.sistina.com/pub/LVM/contrib/uuid_fixer-0.3-IOP10.tar.gz

Make sure you read the README.

Regards,
-- 
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
All good pings must come to an end.
-----End Obligatory Humorous Quote------------------------------------------
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Einstein said that talking to yourself is a sign of intelligence.
Answering yourself, however, is a sign of insanity.
-----End Obligatory Humorous Quote------------------------------------------
