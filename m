Date: Sat, 8 Nov 2008 01:19:04 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] reading lun snapshots with identical lvm
	informationon them on one machine
Message-ID: <20081108011904.GG14593@agk.fab.redhat.com>
References: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
	<20081105013103.GL14593@agk.fab.redhat.com>
	<8D07631D47C3CB4F867AD7BCF07D5C2307F48B@excs01.bucoks>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C2307F48B@excs01.bucoks>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James A. Dinkel" <jdinkel@bucoks.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--config takes settings inline that override settings in the file
e.g. --config 'devices { filter = ... }'

The environment variable method replaces the whole /etc dir with
an alterative - e.g. set it to /etc/lvm-tmp and put the new conf file there.

Alasdair
-- 
agk@redhat.com
