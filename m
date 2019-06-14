References: <5d0599c5-699c-7c35-8847-3c4787e3e245@izyk.ru>
	<7ee5ada1a5dc5256064c475f3179c6ac@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8ed636be-e43f-d97b-e994-31ccb40c71a7@redhat.com>
Date: Fri, 14 Jun 2019 10:54:56 +0200
MIME-Version: 1.0
In-Reply-To: <7ee5ada1a5dc5256064c475f3179c6ac@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Maximum address used by a virtual disk on a thin
	pool.
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Ilia Zykov <mail@izyk.ru>

Dne 13. 06. 19 v 21:54 Gionatan Danti napsal(a):
> Il 13-06-2019 18:05 Ilia Zykov ha scritto:
>> Hello.
>> Tell me please, how can I get the maximum address used by a virtual disk
>> (disk created with -V VirtualSize). I have several large virtual disks,
>> but they use only a small part at the beginning of the disk. For example:
>>
>> # lvs
>> � LV�������� VG� Attr������ LSize�� Pool���� Origin Data%
>> � mylvm����� CVG Vwi-aot--- 100,00g fastheap������� 7,13
>>
>>
>> Please advise me how to determine from which address the virtual disk
>> did not allocate real disk space? And all the data read from addresses
>> greater than this address will be exactly zeros. Or maybe, how can I get
>> map of the used chunks of disk?
>>
>> Thanks.
> 
> Maybe thin_dump[1] can help you?
> Regards.
> 
> [1] https://linux.die.net/man/8/thin_dump

Hi

There is even better tool that can expose in 'great detail' ownership of
individual thin-pool chunks for each  thin volume - if that's what you
are looking for.  See  'man  thin_ls'

Regards

Zdenek
