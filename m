From: Spam <spam@tnonline.net>
Message-ID: <15458132953.20031117200111@tnonline.net>
Subject: Re: [linux-lvm] Performance problem.
In-Reply-To: <20031117195218.3093c921.neuron@hollowtube.mine.nu>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
 <1069087854.2408.0.camel@localhost.localdomain>
 <20031117181007.00e15a29.neuron@hollowtube.mine.nu>
 <3252989968.20031117183528@tnonline.net>
 <20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
 <11955855390.20031117192313@tnonline.net>
 <20031117193054.5dd7eec1.neuron@hollowtube.mine.nu>
 <6557103468.20031117194401@tnonline.net>
 <20031117195218.3093c921.neuron@hollowtube.mine.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov 17 13:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: neuron <linux-lvm@sistina.com>


>> dd_rescue /dev/hda /dev/null

> Summary for /dev/hda -> /dev/null:rrxfer:         0.0k, succxfer: 230912.0k
> dd_rescue: (info): ipos:    231168.0k, opos:    231168.0k, xferd: 231168.0k
>                    errs:      0, errxfer:         0.0k, succxfer: 231168.0k
>              +curr.rate:    26353kB/s, avg.rate:    25406kB/s, avg.load: 22.1%


  Then you know the read speed with your drives are not a problem. You
  could  try  the  same with /dev/vg/lv instead of your hda and see if
  LVM is slowing down much.
