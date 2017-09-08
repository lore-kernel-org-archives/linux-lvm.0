References: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
	<2feba733-6812-3c1f-d42a-3e5eea82a636@redhat.com>
	<b1e00533-bfa7-fbe0-963d-73854fd0a47e@yahoo.co.uk>
	<35db61ea-5cfd-b332-b229-9a478f1264ef@redhat.com>
	<0c496205-22f6-b01a-183b-dc8995782905@yahoo.co.uk>
	<603bba5b-4351-aebb-e80c-5aeade6cf883@gmail.com>
	<CAAYit8T-mvo28Xqfee-w+BhwNrqOdzAX-QXWEToA9nEWyO8xTw@mail.gmail.com>
	<CAAYit8SYbr7utH+xeGxv_5EW45LOMmU64j-jNuzKtYgVMJ2VLQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <06b07f0e-d92c-0b3d-0bde-84886c3d92db@redhat.com>
Date: Fri, 8 Sep 2017 14:11:02 +0200
MIME-Version: 1.0
In-Reply-To: <CAAYit8SYbr7utH+xeGxv_5EW45LOMmU64j-jNuzKtYgVMJ2VLQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lv raid - how to read this?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ming-Hung Tsai <mingnus@gmail.com>

Dne 8.9.2017 v 13:00 Ming-Hung Tsai napsal(a):
> Oops, I mean, unsuitable for lvm-raid ...
> 
>>
>> Excuses me, does that mean kernel md-raid module in kernel 4.1~4.5 are
>> unstable or unsuitable for linux-md? Is there any reference threads?
>


Yep - take my comments purely in context of lvm2 md core usage which is tested
by our test suite.

I'm not commenting  mdadm nor planing to do it, and will just say both are 
using same core and anyone can check opened RHBZ :)

Regards

Zdenek
