Message-ID: <000601c3adde$08334ab0$e9000a0a@misato>
From: "Henric Andersson" <ha@thedudes.nu>
References: <3FB8F8A1.1060004@clin.ucl.ac.be><1069087854.2408.0.camel@localhost.localdomain><20031117181007.00e15a29.neuron@hollowtube.mine.nu><3252989968.20031117183528@tnonline.net><20031117191324.2047dbf3.neuron@hollowtube.mine.nu><11955855390.20031117192313@tnonline.net><20031117193054.5dd7eec1.neuron@hollowtube.mine.nu><6557103468.20031117194401@tnonline.net><20031117195218.3093c921.neuron@hollowtube.mine.nu><15458132953.20031117200111@tnonline.net><20031117200500.08c5c876.neuron@hollowtube.mine.nu><003601c3ad5d$c74c8370$6402000a@gasaraki><13712767906.20031118014426@tnonline.net><20031118020523.65476a55.neuron@hollowtube.mine.nu><19014718796.20031118021657@tnonline.net> <20031118024250.50134f1c.neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
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
Date: Tue Nov 18 08:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

neuron wrote:
> >   I am afraid I do not have much else to suggest other than trying the
> >   new  2.6.0-test9  kernel  with device mapper. I am running it and so
> >   far it is very stable (and quick).
> >
>
> yeah, I run that on my desktop box, and I'm very happy with it.  I was
gonna try it earlier, but didn't really have time.
> Henric Andersson, if you have the same problems and have the time, let me
know the results if you test.

Was able to borrow a disk from work, so I'm going to make a duplicate of my
system disk and setup a new LVM on two other disks. Then I'm going to
upgrade it to 2.6.0-test9 with devicemapper.

This way, I can learn from my mistakes without loosing my current setup, it
should also give a better idea of how my new setup will perform once I do it
on the real system. Going to do some benchmarking before and after I update
to see what kind of performance difference to expect (if any).

Any tips, ideas or experience anyone want to share before I jump into the
upgrade frenzymode later this evening?

/Henric
