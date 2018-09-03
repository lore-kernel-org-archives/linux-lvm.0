References: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b227ce32-6612-7604-477d-70f2b46a9543@redhat.com>
Date: Mon, 3 Sep 2018 16:52:10 +0200
MIME-Version: 1.0
In-Reply-To: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Prepend LV
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Oleksandr Panchuk <panolex@gmail.com>

Dne 3.9.2018 v 11:04 Oleksandr Panchuk napsal(a):
> Hello, All
> 
> I have not found any documentation about how to prepend LV with some free space
> .
> Possible use case - we have LV with filesystem and data on it. But to migrate 
> this LV to KVM virtual machine we need to craft partition inside this LV with 
> already existing data.
> 
> I know it is possible to create new LV and copy data here, but it could be 
> time consuming for big LVs.
> 
> So, Is there any way to prepend LV with some free space ?
> 

Hi

Lvm2 does NOT support prepend ATM - as there was no big need for such operation.

On the other hand - experienced user can  with really low 'math-skill' 
requirements  for a manual  extension on the 'ASCII VG metadata' file in 'vi' 
editor -  the format is quite easy to follow.

I assume there is already some RFE to provide such support - in terms of 
existing limitation that you need to always prepend whole 'extent'  (so i.e. 
with 4MiB  extent size - you need to prepend at least 4MiB)

Regards


Zdenek
