From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] help: can't read name(s) of physical volumes
 (Debian kernel weirdness also involved)
Message-ID: <59050000.1039927015@[192.168.200.4]>
In-Reply-To: <Pine.GSO.4.44L-027.0212142036200.10732-100000@unix3.andrew.cmu.edu>
References: <Pine.GSO.4.44L-027.0212142036200.10732-100000@unix3.andrew.cmu.
 edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat Dec 14 22:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Here's the situation. I just installed Debian 3.0 testing and I set it up
> so that I was using their lvm10 package (version 1.0.4-6) for /usr, /var
> /home, etc. (NOT /) It works fine off the kernel that Debian uses in its
> install (2.4.18-bf2.4). BUT, if I install a stock Debian kernel with
> apt-get (kernel-image-2.4.18-k7), lvm cannot see my physical volumes at
> boot-time.

Make sure that the stock kernel has LVM	installed, then
upgrade to 1.0.6 (via http://www.sistina.com/). Building
a 2.4.10 kernel w/ 1.0.6 (if you want to stick with 1.0)
should give you the best results.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
