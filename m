From: "Steven Stillaway" <steve@stillaway.net>
Subject: Re: [linux-lvm] Re: device-mapper transition
Message-ID: <20021011090446.GA5506@sparcbox.net>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021011075220.GA1153@fib011235813.fsnet.co.uk>
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
Date: Fri Oct 11 04:05:11 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 11, 2002 at 08:52:21AM +0100, Joe Thornber wrote:
 
> If you do try 2.5 feedback would be appreciated.
> 
> - Joe
> 

After much time mostly spend trying to figure out how
bitkeeper works I have managed to get DM compiled and 
working with 2.5.41

There were no problems compiling and it seems to be
working fine so far.

The only really tricky bit has been the fact that the
lvm tools (in particular vgscan) are completely
different between the two version.  Actually LVM 2 just
seems to have one tool with a lot of symlinks.

So when I switch from 2.4.19 w/ LVM 1 to 2.5.41 w/
LVM2 I have to make sure to switch from one vgscan to
the other.

The obviously solution is to upgrade my 2.4.19 to 
LVM2, but not tonight -- it is late.

If I notice anything I will let you know.  If you
have any questions or want some data from my test
box please let me know.

Off to bed now -- later

--

Steven Stillaway
steve@stillaway.net
