Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k57EAXSo019554
	for <linux-lvm@redhat.com>; Wed, 7 Jun 2006 10:10:34 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k57EAVrH013381
	for <linux-lvm@redhat.com>; Wed, 7 Jun 2006 10:10:32 -0400
Message-ID: <4486DE48.9060603@conterra.de>
Date: Wed, 07 Jun 2006 16:10:16 +0200
From: =?UTF-8?B?RGlldGVyIFN0w7xrZW4=?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How Can I modify the mapping PE to LE??
References: <16630672.1149686019060.JavaMail.root@mail1>
In-Reply-To: <16630672.1149686019060.JavaMail.root@mail1>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: jowkju@postech.ac.kr, LVM general discussion and development <linux-lvm@redhat.com>

조완근 wrote:
> Hello, I'm at the beginning to use LVM in my machine.
>
> Could you give any information on the implementation details of LVM and 
> device mapper?? More specifically, I want to change the "mapping between 
> PE and LE" for some purposes, however I'm just finished to read the 
> manual of LVM-HowTO. This means that I'm totally a newbie in LVM and 
> device-mapper. I just read some codes on data 
> ...
> I'll use LVM for this purpose - I would like to make a program to change the 
> mapping relationship between PE and LE in my own. In fact, the program's goal
> is to move an extent in a bad disk to a disk with good performance. The movement 
> is done by the extent. In order to do it, I definitely, have to know how I can 
> modify the mapping and maybe, the entire structure of LVM and device mapper.

Hmm, are you realy finished to read the manual :-)

Sounds to me like you reinvent the "pvmove" command.
This is not "some purpose" but a central task
LVM performs for you on demand!

regards, Dieter.
