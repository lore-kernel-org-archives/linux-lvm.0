Subject: Re: [linux-lvm] Re: device-mapper transition
Message-ID: <20021011093118.GA2057@fib011235813.fsnet.co.uk>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk> <20021011090446.GA5506@sparcbox.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021011090446.GA5506@sparcbox.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Oct 11 04:32:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 11, 2002 at 02:04:46AM -0700, Steven Stillaway wrote:
> The only really tricky bit has been the fact that the
> lvm tools (in particular vgscan) are completely
> different between the two version.  Actually LVM 2 just
> seems to have one tool with a lot of symlinks.

You can use the single tool directly without creating the symlinks.

> So when I switch from 2.4.19 w/ LVM 1 to 2.5.41 w/
> LVM2 I have to make sure to switch from one vgscan to
> the other.

When I'm testing new tools I just run the new build without installing it.

eg,

cd <my_build_dir>/tools
./lvm vgchange -ay

- Joe
