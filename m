From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Error with 2.5.50-dm-2; vanilla OK
Message-ID: <20021210125142.A27380@uk.sistina.com>
References: <3DF587F2.5060609@starhub.net.sg> <20021210093827.GB1479@reti>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021210093827.GB1479@reti>; from joe@fib011235813.fsnet.co.uk on Tue, Dec 10, 2002 at 09:38:27AM +0000
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
Date: Tue Dec 10 06:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 10, 2002 at 09:38:27AM +0000, Joe Thornber wrote:
> Can you mail me (rather than the list) the complete lvm2 log after
> trying your vgchange -ay.  
e.g. run 'vgchange -ay -vvv' and send the full output;
  or edit the log section config file to capture the debug output
  (see doc/example.conf):
    level = 7
    overwrite = 1
    file = "/tmp/lvmlog"

Alasdair
-- 
agk@uk.sistina.com
