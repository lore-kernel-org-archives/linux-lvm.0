From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807093309.GA6602@localhost>
References: <1060247670.28307.37.camel@rocky>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1060247670.28307.37.camel@rocky>
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
Date: Thu Aug  7 04:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thursday, 07 August 2003, at 17:14:30 +0800,
Rocky Lee wrote:

> but it'll be great if there's a tool,
> that supoorts block-level increment backup....
> 
Well, seems you are looking for something like "rsync", but at block
level, not filesystem level. If you could convince "rsync" to consider a
block device as if it where a (huge) file directory, maybe it could work.

However "rsync" insists on treating special (block device) files as
such, an refuses to open them like they where files from which to read.

Regards,

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test2-mm2)
