From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] lvm2 debian packages
Message-ID: <20020519034931.GA21574@chunk.voxel.net>
References: <20020508011851.GA2587@chunk.voxel.net> <20020513161418.GA12207@ntlworld.com> <20020514024053.GA26951@chunk.voxel.net> <20020515161719.GA20704@ntlworld.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020515161719.GA20704@ntlworld.com>
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
Date: Sat May 18 22:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Andy Baillie <andrew.baillie@ntlworld.com>

I've committed some code which should fix this, assuming the problem
you're having is related to mkdir("/var/lock/lvm") failing because of a
missing /var/lock (and not because /var is read-only or something).

On Wed, May 15, 2002 at 05:17:19PM +0100, Andy Baillie wrote:
[...]
> 
> The only other issue outstanding is that the vgscan process uses
> /var/lock if this directory does not exist when the vgscan occurs
> then the scan fails. Though I mount /var as an lvm partition I have
> created /var/lock from root and this seems to work fine. I havn't
> found any problems with that yet.
> 
[...]

-- 
<dilinger> people fear what they don't understand
<zinx> that is not true
<zinx> most people fear what they don't understand, and the rest get killed
	by those people
