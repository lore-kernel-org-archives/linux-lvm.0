From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] lvm & 2.5
Message-ID: <20020706214704.GA15168@chunk.voxel.net>
References: <Pine.LNX.4.44L.0207061339150.8346-100000@imladris.surriel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L.0207061339150.8346-100000@imladris.surriel.com>
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
Date: Sat Jul  6 16:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: riel@conectiva.com.br

AFAIK, there are no plans to support lvm1 in 2.5.  Instead,
device-mapper will replace it.  device-mapper was ported to 2.5 a while
ago by Joe, I don't know if 2.5 support has been kept up-to-date or
not..

On Sat, Jul 06, 2002 at 01:39:39PM -0300, Rik van Riel wrote:
> 
> Hi,
> 
> are there any plans to fix lvm support for 2.5 or should I
> drop lvm from my test boxes until 2.6 comes out ?
> 
> Rik
> -- 
> Bravely reimplemented by the knights who say "NIH".
> 
> http://www.surriel.com/		http://distro.conectiva.com/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Broad surveillance is a mark of bad security.
	-- Bruce Schneier
