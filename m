References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
Date: Tue, 2 Jan 2018 12:03:01 +0100
MIME-Version: 1.0
In-Reply-To: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gordon Messmer <gordon.messmer@gmail.com>

On 01/02/2018 07:47 AM, Gordon Messmer wrote:
> I'd like to avoid scanning LVs, and I thought I'd set global_filter 
> appropriately.  The following logs show global_filter set to reject 
> ^/dev/VolGroup/vm_, but the system is scanning 
> /dev/VolGroup/vm_wiki_data.  Any hints as to what I'm doing wrong?
> 
> 
> 
> Dec 06 13:08:37 kvm-test.private lvm[532]: Setting devices/global_filter 
> to global_filter = [ "r|^/dev/VolGroup/vm_|", "r|^/dev/dm-|", "a|.*/|" ]

Hi Gordon, remove the last component in the filter: 'a|.*/|'.

Filters accept any device if any of it's "names" (all symbolic links) is 
matched by an a pattern ("a|.*/|" in your case) and matches no previous 
r pattern - for example anything in /dev/mapper/ is accepted.

When used as a blacklist filter(s) must contain only "r" paterns.

BTW it is usually better to use white list: list "a" patterns for all 
disks you wish to accept and add "r|.*|" at the end.

-- Martian
