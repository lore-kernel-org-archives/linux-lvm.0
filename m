From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] getting started with LVM
Message-ID: <20020524021008.GA22856@tiger.bigcats.invalid>
References: <3CED546C.2000401@jumpline.com> <40970000.1022186992@duke> <3CED5725.8070006@jumpline.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CED5725.8070006@jumpline.com>
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
Date: Thu May 23 21:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Ben!

Ben Snyder (ben@jumpline.com) wrote 54 lines:

> Something I probably should have mentioned....due to some software we 
> use to serve our customers, we have hard links - TONS of them. 

Have you looked at afio (and it's -4 option for dealing with more
than 64k hardlinks)?  Be sure to read the 'BUGS' section as well.

Oh, and afio can compress the backup -- by compressing 'per
file', thus corruption only kills the affected files.

-Wolfgang
