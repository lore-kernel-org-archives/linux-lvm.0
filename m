Date: Tue, 9 Oct 2001 15:49:00 +0200
From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] Too many problems
Message-ID: <20011009154900.A21825@balu.kawo2.rwth-aachen.de>
References: <002901c150b3$9d330860$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002901c150b3$9d330860$836788cf@industry>; from jlixfeld@andromedas.com on Tue, Oct 09, 2001 at 07:14:50AM -0400
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Cc: linux-lvm@sistina.com

On Tue, Oct 09, 2001 at 07:14:50AM -0400, Jason A. Lixfeld wrote:
> I just need to know what a stable release of LVM is for RedHat and what
> compiler to use.  The stock RedHat 7.1 compiler is buggy, from what I
> understand here.  I've had so many problems in the last week and I'm
> getting really frustrated with all of this :(  I'm using kernel 2.4.10
> but am more than willing go to down a couple revs for something stable.

Redhat 7.1, the Redhat version of gcc, stock kernel 2.4.10 +
lvm-1.0.1rc4 work fine for me, _AFTER_ switching off any optimization
in the configure-script of LVM (change -O2 to -O0).

Regards, Markus
