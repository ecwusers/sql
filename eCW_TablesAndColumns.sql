<report xmlns="http://developer.cognos.com/schemas/report/6.0/" expressionLocale="en">
				<modelPath>/content/package[@name='eCWEBO']/model[@name='model']</modelPath>
				<drillBehavior modelBasedDrillThru="true"/>
				<queries>
					<query name="TablesAndColumns">
						<source>
							
						<sqlQuery name="SQL1" dataSource="eClinicalWorks">
			<sqlText>SELECT
  TABLE_SCHEMA,
  TABLE_NAME,
  COLUMN_NAME,
  DATA_TYPE
FROM 

 INFORMATION_SCHEMA.COLUMNS Cols
WHERE
  Cols.TABLE_SCHEMA IN (#PROMPTMANY('Schema')#)

ORDER BY 

 Cols.TABLE_NAME, 

 Cols.ORDINAL_POSITION</sqlText>
		<mdProjectedItems><mdProjectedItem name="TABLE_SCHEMA"/><mdProjectedItem name="TABLE_NAME"/><mdProjectedItem name="COLUMN_NAME"/><mdProjectedItem name="DATA_TYPE"/></mdProjectedItems></sqlQuery></source>
						<selection><dataItem name="TABLE_SCHEMA"><expression>[SQL1].[TABLE_SCHEMA]</expression></dataItem><dataItem name="TABLE_NAME"><expression>[SQL1].[TABLE_NAME]</expression></dataItem><dataItem name="COLUMN_NAME"><expression>[SQL1].[COLUMN_NAME]</expression></dataItem><dataItem name="DATA_TYPE"><expression>[SQL1].[DATA_TYPE]</expression></dataItem></selection>
					<detailFilters><detailFilter use="optional"><filterExpression>[COLUMN_NAME]  CONTAINS(?ColFilter?)</filterExpression></detailFilter><detailFilter use="optional"><filterExpression>[TABLE_NAME] CONTAINS(?TableFilter?)</filterExpression></detailFilter></detailFilters></query>
				<query name="Prompt_Schema">
			<source>
				
			<sqlQuery name="SQL2" dataSource="eClinicalWorks">
			<sqlText>SELECT distinct
  TABLE_SCHEMA
FROM
  INFORMATION_SCHEMA.TABLES Tables</sqlText>
		<mdProjectedItems><mdProjectedItem name="TABLE_SCHEMA"/></mdProjectedItems></sqlQuery></source>
			<selection><dataItem name="TABLE_SCHEMA"><expression>[SQL2].[TABLE_SCHEMA]</expression></dataItem></selection>
		</query></queries>
				<layouts>
					<layout>
						<reportPages>
							<page name="Page1"><style><defaultStyles><defaultStyle refStyle="pg"/></defaultStyles></style>
								<pageBody><style><defaultStyles><defaultStyle refStyle="pb"/></defaultStyles><CSS value="text-align:center"/></style>
									<contents>
										<list horizontalPagination="true" name="List1" refQuery="TablesAndColumns">
											
											
											
											<style>
												<defaultStyles>
													<defaultStyle refStyle="ls"/>
												</defaultStyles>
												<CSS value="border-collapse:collapse"/>
											</style>
										<listColumns><listColumn><listColumnTitle><style><defaultStyles><defaultStyle refStyle="lt"/></defaultStyles></style><contents><textItem><dataSource><dataItemLabel refDataItem="TABLE_SCHEMA"/></dataSource></textItem></contents></listColumnTitle><listColumnBody><style><defaultStyles><defaultStyle refStyle="lm"/></defaultStyles></style><contents><textItem><dataSource><dataItemValue refDataItem="TABLE_SCHEMA"/></dataSource></textItem></contents><listColumnRowSpan refDataItem="TABLE_SCHEMA"/></listColumnBody></listColumn><listColumn><listColumnTitle><style><defaultStyles><defaultStyle refStyle="lt"/></defaultStyles></style><contents><textItem><dataSource><dataItemLabel refDataItem="TABLE_NAME"/></dataSource></textItem></contents></listColumnTitle><listColumnBody><style><defaultStyles><defaultStyle refStyle="lm"/></defaultStyles></style><contents><textItem><dataSource><dataItemValue refDataItem="TABLE_NAME"/></dataSource></textItem></contents><listColumnRowSpan refDataItem="TABLE_NAME"/></listColumnBody></listColumn><listColumn><listColumnTitle><style><defaultStyles><defaultStyle refStyle="lt"/></defaultStyles></style><contents><textItem><dataSource><dataItemLabel refDataItem="COLUMN_NAME"/></dataSource></textItem></contents></listColumnTitle><listColumnBody><style><defaultStyles><defaultStyle refStyle="lm"/></defaultStyles></style><contents><textItem><dataSource><dataItemValue refDataItem="COLUMN_NAME"/></dataSource></textItem></contents></listColumnBody></listColumn><listColumn><listColumnTitle><style><defaultStyles><defaultStyle refStyle="lt"/></defaultStyles></style><contents><textItem><dataSource><dataItemLabel refDataItem="DATA_TYPE"/></dataSource></textItem></contents></listColumnTitle><listColumnBody><style><defaultStyles><defaultStyle refStyle="lm"/></defaultStyles></style><contents><textItem><dataSource><dataItemValue refDataItem="DATA_TYPE"/></dataSource></textItem></contents></listColumnBody></listColumn></listColumns><listGroups><listGroup refDataItem="TABLE_SCHEMA"/><listGroup refDataItem="TABLE_NAME"/></listGroups></list>
									</contents>
								</pageBody>
								<pageHeader>
									<contents>
										<block><style><defaultStyles><defaultStyle refStyle="ta"/></defaultStyles></style>
											<contents>
												<textItem><style><defaultStyles><defaultStyle refStyle="tt"/></defaultStyles></style>
													<dataSource>
														<staticValue>eCW Tables &amp; Columns</staticValue>
													</dataSource>
												</textItem>
											</contents>
										</block>
									<textItem><dataSource><reportExpression>'For Schema(s): ' + ParamDisplayValue('Schema') 
+ ' || and Table Names Contain ' + ParamDisplayValue('TableFilter')
+ ' || and Column Names Contain ' + ParamDisplayValue('ColFilter')</reportExpression></dataSource></textItem></contents>
									<style>
										<defaultStyles>
											<defaultStyle refStyle="ph"/>
										</defaultStyles>
										<CSS value="padding-bottom:10px;text-align:center"/>
									</style>
								</pageHeader>
								<pageFooter>
									<contents>
										<table>
											<tableRows>
												<tableRow>
													<tableCells>
														<tableCell>
															<contents>
																<date>
																	<style>
																		<dataFormat>
																			<dateFormat/>
																		</dataFormat>
																	</style>
																</date>
															</contents>
															<style>
																<CSS value="vertical-align:top;text-align:left;width:25%"/>
															</style>
														</tableCell>
														<tableCell>
															<contents>
																<pageNumber/>
															</contents>
															<style>
																<CSS value="vertical-align:top;text-align:center;width:50%"/>
															</style>
														</tableCell>
														<tableCell>
															<contents>
																<time>
																	<style>
																		<dataFormat>
																			<timeFormat/>
																		</dataFormat>
																	</style>
																</time>
															</contents>
															<style>
																<CSS value="vertical-align:top;text-align:right;width:25%"/>
															</style>
														</tableCell>
													</tableCells>
												</tableRow>
											</tableRows>
											<style>
												<defaultStyles>
													<defaultStyle refStyle="tb"/>
												</defaultStyles>
												<CSS value="border-collapse:collapse;width:100%"/>
											</style>
										</table>
									</contents>
									<style>
										<defaultStyles>
											<defaultStyle refStyle="pf"/>
										</defaultStyles>
										<CSS value="padding-top:10px"/>
									</style>
								</pageFooter>
							</page>
						</reportPages>
					<promptPages><page name="Prompt Page1">
			<pageHeader>
				<contents>
					<block>
						<contents>
							<textItem>
								<dataSource>
									<staticValue>eCW DB Tables </staticValue>
								</dataSource>
								<style>
									<defaultStyles>
										<defaultStyle refStyle="tt"/>
									</defaultStyles>
								</style>
							</textItem>
						</contents>
						<style>
							<defaultStyles>
								<defaultStyle refStyle="ta"/>
							</defaultStyles>
						</style>
					</block>
				</contents>
				<style>
					<defaultStyles>
						<defaultStyle refStyle="hp"/>
					</defaultStyles>
				</style>
			</pageHeader>
			<pageBody>
				<contents><table><style><defaultStyles><defaultStyle refStyle="tb"/></defaultStyles><CSS value="border-collapse:collapse"/></style><tableRows><tableRow><tableCells><tableCell><contents><textItem><dataSource><staticValue>For Schema(s)</staticValue></dataSource></textItem></contents></tableCell><tableCell><contents><selectValue parameter="Schema" selectValueUI="listBox" multiSelect="true" range="false" required="true" refQuery="Prompt_Schema"><useItem refDataItem="TABLE_SCHEMA"><displayItem refDataItem="TABLE_SCHEMA"/></useItem></selectValue></contents></tableCell></tableCells></tableRow><tableRow><tableCells><tableCell><contents><textItem><dataSource><staticValue>Column Names Contian (OPTIONAL):</staticValue></dataSource></textItem></contents></tableCell><tableCell><contents><textBox parameter="ColFilter"/></contents></tableCell></tableCells></tableRow><tableRow><tableCells><tableCell><contents><textItem><dataSource><staticValue>Table Names Contain (OPTIONAL):</staticValue></dataSource></textItem></contents></tableCell><tableCell><contents><textBox parameter="TableFilter"/></contents></tableCell></tableCells></tableRow></tableRows></table></contents>
				<style>
					<defaultStyles>
						<defaultStyle refStyle="py"/>
					</defaultStyles>
				<CSS value="text-align:center"/></style>
			</pageBody>
			<pageFooter>
				<contents>
					<promptButton type="cancel">
						<contents/>
						<style>
							<defaultStyles>
								<defaultStyle refStyle="bp"/>
							</defaultStyles>
						</style>
					</promptButton>
					<promptButton type="back">
						<contents/>
						<style>
							<defaultStyles>
								<defaultStyle refStyle="bp"/>
							</defaultStyles>
						</style>
					</promptButton>
					<promptButton type="next">
						<contents/>
						<style>
							<defaultStyles>
								<defaultStyle refStyle="bp"/>
							</defaultStyles>
						</style>
					</promptButton>
					<promptButton type="finish">
						<contents/>
						<style>
							<defaultStyles>
								<defaultStyle refStyle="bp"/>
							</defaultStyles>
						</style>
					</promptButton>
				</contents>
				<style>
					<defaultStyles>
						<defaultStyle refStyle="fp"/>
					</defaultStyles>
				</style>
			</pageFooter>
			<style>
				<defaultStyles>
					<defaultStyle refStyle="pp"/>
				</defaultStyles>
			</style>
		</page></promptPages></layout>
				</layouts>
			<XMLAttributes><XMLAttribute name="RS_CreateExtendedDataItems" value="true" output="no"/><XMLAttribute name="listSeparator" value="," output="no"/></XMLAttributes></report>
