From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] LVM logging fills my /var
Message-Id: <20020215153642.GA10710@gondor.com>
References: <3C6D1F24.64AB7DEA@silicide.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C6D1F24.64AB7DEA@silicide.dk>
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
Date: Fri Feb 15 09:36:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 15, 2002 at 03:45:56PM +0100, Jon Bendtsen wrote:
> How do i turn it off, or down to a more modest level ??

Just comment it out in /etc/cron.d/lvm-common

Jan
