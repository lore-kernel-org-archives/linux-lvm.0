Date: Wed, 5 Sep 2001 11:33:07 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20010905113307.A19406@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV size maximum
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I'm to build some storage pool for an in-company network. It
will exceed 1TB in some time, so I'd like to get some proper
information on this *before* I get into trouble:-) So, my
final question is: How big may an LV be?

The FAQ tells me (in Q9) something of 2TB, but lvextend INFOs
me of a maximum of 1TB. Where's the real limit? My understanding
is that limitation is coming from kernel to handle all data
in chunks of 512Bytes. Is the maximum number of 512Byte blocks
per device to be increased in some time?

MfG, JBG

-- 
Jan-Benedict Glaw . jbglaw@lug-owl.de . +49-172-7608481
