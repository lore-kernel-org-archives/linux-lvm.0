Subject: Re: [linux-lvm] lvm & 2.5
Message-ID: <20020707204613.GB2400@fib011235813.fsnet.co.uk>
References: <Pine.LNX.4.44L.0207061339150.8346-100000@imladris.surriel.com> <20020706214704.GA15168@chunk.voxel.net> <1026027187.3d27eeb385436@secure.st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1026027187.3d27eeb385436@secure.st-peter.stw.uni-erlangen.de>
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
Date: Sun Jul  7 14:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 07, 2002 at 09:33:07AM +0200, Svetoslav Slavtchev wrote:
> Quoting Andres Salomon <dilinger@mp3revolution.net>:
> 
> > AFAIK, there are no plans to support lvm1 in 2.5.  Instead,
> > device-mapper will replace it.  device-mapper was ported to 2.5 a while
> > ago by Joe, I don't know if 2.5 support has been kept up-to-date or
> > not..
> not acctually :(
> it's from device-mapper-beta1 and if i can remmember it's against 2.5.9
> don't think it will work with a current kernel
> and it's not available per ftp or cvs

The 2.5 port is nearing the top of my work stack - at the moment the
userland code for pvmove is taking precedence.  But once this is done
(1-2 weeks) I'll be working full time on 2.5.

- Joe
