From: Brant Katkansky <lists@katkansky.org>
Subject: Re: [linux-lvm] dump/restore on a regular file?
Message-ID: <20040117071735.GA26000@aquila.katkansky.org>
References: <BAY9-F23qkf5tjDpd3n000023e1@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY9-F23qkf5tjDpd3n000023e1@hotmail.com>
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
Date: Sat Jan 17 02:18:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 17, 2004 at 12:20:37PM +0530, kanika nema wrote:
> hi,
> 
> I wanted to use the dump/restore using the backup as a regular file, 
> instead of the tape. I read the manpages and the documentation on 
> dump/restore..but i cant figure out how to do it on a regular file.

try this:

dump -0 -f dump.out /dev/xxx
