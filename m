From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] What are they talking about?
References: <20030521204843.ZNFH1333.imf40bis.bellsouth.net@tiger2>
In-Reply-To: <20030521204843.ZNFH1333.imf40bis.bellsouth.net@tiger2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200305211603.39641.kevcorry@us.ibm.com>
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
Date: Wed May 21 16:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Greg Freemyer <freemyer@NorcrossGroup.com>, "Anastasios A. Papadopoulos (Tas)" <vze2sjj7@verizon.net>
Cc: EVMS <evms-devel@lists.sourceforge.net>

On Wednesday 21 May 2003 15:53, Greg Freemyer wrote:
> Kevin,
>
> I understand how LVM2, DM, and EVMS are architected.
>
> I still have no idea what the article is talking about.
>
> Are you saying that the referenced sources just don't understand how it all
> works and that the "industrial-strength Logical Volume Manager" they want
> is achievable via the current DM implementation in combination with
> appropriate high quality user-space tools?

Yes, that would be my opinion. DM provides all of the infrastructure that the 
kernel requires. (It can be further enhanced by adding sub-modules 
("targets") to provide new ways to map devices). Then it's up to the 
user-space tools to figure out how to best use this infrastructure.

> That certainly agrees with what I thought and why I was so confused by the
> article.

I was quite confused by the article as well. :)

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
