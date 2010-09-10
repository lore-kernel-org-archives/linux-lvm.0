Message-ID: <4C8A52F5.4080801@redhat.com>
Date: Fri, 10 Sep 2010 17:47:01 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <5fa6d3.12b5c.12afc29d278.Coremail.ooolinux@163.com>
In-Reply-To: <5fa6d3.12b5c.12afc29d278.Coremail.ooolinux@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what is writed on raw disk,
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
Cc: yue <ooolinux@163.com>

Dne 10.9.2010 17:00, yue napsal(a):
> VolGroup00 {
>  id = "QCNEJh-9bbG-x6AV-uZEz-Dhsi-1LL7-fYSWbL"
>  seqno = 4
>  status = ["RESIZEABLE", "READ", "WRITE"]
...
>   }
>  }//logical_volumes
> }
> ------------------------------------
> how many this kind of struct is writed on raw disk,and its value???what is different??
> how a group is parsed?


There is always at least one back-up copy, to be able to do commit - first
write new metadata - and when they are fully written mark them as valid. So in
case of any write problem there is always previous last valid version
available - see pvcreate --metadatasize --metadatasize  and some other options
in manpage)

Major part of parser is located in lib/config/config.c.

As for your previous question about some detailed  LVM architecture document -
well mostly only the source code itself...

It would probably be better to specify what are you trying to achieve to get
help with that ?

Zdenek
