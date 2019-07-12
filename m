References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
	<d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
	<756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
	<9b95869d-4693-a890-3340-41a05c7e7308@linagora.com>
	<fb5379cd-7260-d2fa-4abe-7ffd05f635cb@redhat.com>
	<75cb7cc1-c863-86de-4a31-ca2a2ffa23dd@linagora.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <adba2e2b-add1-6a3e-fe85-334369e59735@redhat.com>
Date: Fri, 12 Jul 2019 15:07:04 +0200
MIME-Version: 1.0
In-Reply-To: <75cb7cc1-c863-86de-4a31-ca2a2ffa23dd@linagora.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Simon ELBAZ <selbaz@linagora.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 12. 07. 19 v 14:38 Simon ELBAZ napsal(a):
> Hi,
> 
  root@sympa:~# swapon /dev/sympa-vg/swap_1
> root@sympa:~# lvdisplay
> ...
> 
>    --- Logical volume ---
>    LV Path                /dev/sympa-vg/swap_1
>    LV Name                swap_1
>    VG Name                sympa-vg
>    LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
>    LV Write Access        read/write
>    LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
>    LV Status              available
>    # open                 2
>    LV Size                <1,99 GiB
>    Current LE             509
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           254:1
> 
> I wonder if there is a similar tool for regular filesystem types.
> 

Hi


See:  mount

or

/proc/self/mountinfo


Regards

Zdenek
