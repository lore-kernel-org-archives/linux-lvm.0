Message-ID: <011001c3ad45$6ed13960$e10aa8c0@zaphod>
From: "Michael Paesold" <mpaesold@gmx.at>
References: <3FB8F8A1.1060004@clin.ucl.ac.be><1069087854.2408.0.camel@localhost.localdomain><20031117181007.00e15a29.neuron@hollowtube.mine.nu><3252989968.20031117183528@tnonline.net> <20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
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
Date: Mon Nov 17 14:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

neuron wrote:

> elvtune shows read_latency of 2048 and write_latency of 8192,
> that's already quite low isn't it?  If not, have any example
> values I can test with?

Those are the default values for RedHat 8.0, and probably some other
systems. For RedHat 9.0 the defaults are:

/dev/cciss/c0d0 elevator ID             2
        read_latency:           64
        write_latency:          8192
        max_bomb_segments:      6

You could try 64 or even 32 and do your "real-world test" (listening to
MP3...).

Regards,
Michael Paesold
