From: Christophe Zwecker <czwecker@sysctl.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1011111148.3294.8.camel@fry.sysctl-office.de>
MIME-Version: 1.0
Subject: [linux-lvm] xfs quota on lvm
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
Date: Tue Jan 15 10:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Ive got alle volumes on linux RH with xfs and all except /  "lvmed".

I got quota enabled in kernel, xfs quota support too. Quota is enabled
at mount. However when I do eduota -u user, I get only to change numbers
on the nonlvm partition.

Is quota nonfunctional on lvm partitions ?

Best regards,

Christophe
-- 
Christophe Zwecker
:Sysctl				
Susannenstr. 26-28		
20357 Hamburg			
phon/fax: +49 40 43099296/7		
mail: czwecker@sysctl.de
