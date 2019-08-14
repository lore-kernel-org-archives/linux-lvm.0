References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
	<7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
	<DB7PR08MB3307023F548797EE6D6D60ACFFD20@DB7PR08MB3307.eurprd08.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ef402f7a-ca9b-c69e-6ed2-6963abc3cd33@redhat.com>
Date: Wed, 14 Aug 2019 13:09:33 +0200
MIME-Version: 1.0
In-Reply-To: <DB7PR08MB3307023F548797EE6D6D60ACFFD20@DB7PR08MB3307.eurprd08.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
	though it exists
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Bernd Eckenfels <ecki@zusammenkunft.net>

Dne 13. 08. 19 v 23:25 Bernd Eckenfels napsal(a):
> Hello,
> 
> I did not know dmsetup works with lvm file names, did you try to run `dmsetup 
> ls` to see the known devices and the dm compatible name?

Hi

Of course it has to work.

lvm2 names are just symlinks to /dev/dm-XXX real device nodes.

If symlinks are missing - something is broken in the setting configuration...


Regards

Zdenek
