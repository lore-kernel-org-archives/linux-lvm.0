From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030530075022.GA445@fib011235813.fsnet.co.uk>
References: <3ED32F3E.9000009@silicide.dk> <3ED478E1.1020509@silicide.dk> <200305281643.04803.jhs@oes.co.th> <200305291427.15518.dphillips@sistina.com> <20030529212127.GA4011@fib011235813.fsnet.co.uk> <20030529220239.GA1190@gw.silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030529220239.GA1190@gw.silicide.dk>
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
Date: Fri May 30 02:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 30, 2003 at 12:02:39AM +0200, jon+lvm@silicide.dk wrote:
> i am planning to write my own targets as a graduate project.
> My idea was encryption and possibly compression as well.
> (is anyone else doing any of these targets?)

This is an idea that quite a few people have come up with, but as far
as I know nobody is following up on it.  I'd suggest you start with
the encryption target, I think that's slightly easier since you can
arrange for the encrypted data to be the same size as clear.  You
should then use the end_io() method to catch the buffer_heads after
they've read the encrypted data and decrypt it there.  The dm side
should be very simple, yell if you have any questions.

- Joe
