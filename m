Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i214Qa809118
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:26:36 -0500
Received: from hotmail.com (law11-oe28.law11.hotmail.com [64.4.16.85])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i214Qab26309
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:26:36 -0500
From: "sachin" <sachindurge@hotmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <LAW11-OE28DKBKhwWn500022e47@hotmail.com>
Subject: [linux-lvm] Snapshot validity
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 29 23:26:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

> Hi All
>
> I have a question.

LVM1 or LVM2 ?

- Joe

Hi All

I am using lvm1

-SachiN_

_==__==__==__==__==__==__==_

Original messagel was


Hi All

I have a question.
What happen if i have change the configuration of the snapshot origin volume
i.e i may change the size of the volume .Is the snapshot is valid or its of
no use

What i think is data is of no use ,because internally the driver may
checking the
extent mapping of the origin of the  snapshot and then it scanning the
ioexception table
i.e COW table .If my assumption is not correct ,If any one knows the actual
working
Please tell  me .

Thanks
SachiN_
